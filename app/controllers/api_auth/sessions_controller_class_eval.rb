require_dependency APIAuth::Engine.root.join('app', 'controllers', 'api_auth', 'sessions_controller').to_s

Rails.application.config.to_prepare do
  APIAuth::SessionsController.class_eval do
    before_action :check_auth

    def create
      email = session_params[:email].downcase if session_params[:email]

      q = "uid = ? AND provider='email'"

      if ActiveRecord::Base.connection.adapter_name.downcase.starts_with? 'mysql'
        q = "BINARY uid = ? AND provider='email'"
      end

      @resource = User.active(true).where(q, email).first

      if @resource and valid_params? and @resource.valid_password?(session_params[:password]) and @resource.confirmed?
        #create client id
        @client_id = SecureRandom.urlsafe_base64(nil, false)
        @token = SecureRandom.urlsafe_base64(nil, false)

        @resource.tokens[@client_id] = {
            token: BCrypt::Password.create(@token),
            expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
        }

        #Update resource login attributes
        if User.devise_modules.include?(:trackable)
          @resource.sign_in_count = (@resource.sign_in_count) ? @resource.sign_in_count + 1 : 1
          @resource.last_sign_in_at = (@resource.current_sign_in_at) ? @resource.current_sign_in_at : nil
          @resource.last_sign_in_ip = (@resource.current_sign_in_ip) ? @resource.current_sign_in_ip : nil
          @resource.current_sign_in_at = DateTime.now
          @resource.current_sign_in_ip = request.remote_ip
        end

        if @resource.save
          if @resource.respond_to?(:customers) && Gem::Specification::find_all_by_name('customer').any?
            User.current_user = @resource
            Customer::Customer.current_customer = @resource.customers.first if @resource.customers.size == 1
          end

          render :json => {success: t('.success'), token: @token, client_id: @client_id, data: @resource.serializable_hash, meta: @meta}, status: 201
        else
          render :json => {error: t('.error'), meta: @meta}, status: 401
        end

      elsif User.devise_modules.include?(:confirmable) and @resource and not @resource.confirmed?
        render :json => {error: t('.unconfirmed', email: @resource.email), meta: @meta}, status: 401
      else
        render :json => {error: t('.error'), meta: @meta}, status: 401
      end

    end

    def destroy
      # remove auth instance variables so that after_filter does not run
      user = remove_instance_variable(:@current_user) if @current_user
      @client_id = request.headers['client'] if @client_id.nil?
      client_id = remove_instance_variable(:@client_id) if @client_id
      remove_instance_variable(:@token) if @token
      remove_instance_variable(:@current_customer) if @current_customer

      if user and client_id and user.tokens[client_id]
        user.tokens.delete(client_id)
        user.save!

        render :json => {success: t('.success'), meta: @meta}, status: 200
      else
        render :json => {error: t('.not_found'), meta: @meta}, status: 404
      end
    end

    private

    def check_auth
      true
    end
  end
end
