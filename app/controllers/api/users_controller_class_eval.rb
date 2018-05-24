require_dependency APIAuth::Engine.root.join('app', 'controllers', 'api', 'users_controller').to_s

Rails.application.config.to_prepare do
  API::UsersController.class_eval do
    skip_before_action :require_authentication, only: [:create]
    # skip_authorize_resource only: [:create]
    before_action :set_user, only: [:show, :destroy, :recover]
    # before_action :check_auth

    if defined? CanCan
      authorize_resource :class => User
    end

    def select
      list
      render_json_serializer(@users, SelectUserSerializer)
    end

    def index
      list
      @users = apply_filters(@users,
                             :by_customer_id)

      render_json_serializer(@users, UserSerializer)
    end

    def show
      render_json_serializer(@user, UserSerializer)
    end

    def create
      @user = list.new(user_params)

      if @user.save
        render_json_message({success: t('.success')}, 201, {id: @user.id})
      else
        render_json_message({errors: @user.errors.messages}, 422)
      end
    end

    def update_current
      @user = current_user
      update_method(update_current_params)
    end

    def update
      set_user
      update_method(user_params)
    end

    def destroy
      if @user.destroy
        render_json_message({success: t('.success')}, 200)
      else
        render_json_message({errors: @user.errors.messages}, 422)
      end
    end

    def recover
      if @user.restore
        render_json_message({success: t('.success')}, 200)
      else
        render_json_message({errors: @user.errors.messages}, 422)
      end
    end

    def user_avaliations_person
      @evaluations = ::User.user_avaliations_person

      render_json_serializer(@evaluations, EvaluationSerializer)
    end

    def user_avaliations_referee
      @evaluations = ::User.user_avaliations_referee

      render_json_serializer(@evaluations, EvaluationSerializer)
    end

    def user_avaliations
      @evaluations = ::User.user_avaliations

      render_json_serializer(@evaluations, EvaluationSerializer)
    end

    private

    def list
      @users = ::User.all
      @users = apply_filters(@users,
                             :by_email,
                             :active_boolean)

      @users = @users.active(true) if params['active'].nil?

    end

    # def check_auth
    #   if params[:authkey].present?||request.headers['authkey'].present?
    #     @integration = ::Integration.where(auth_key: params[:authkey]||request.headers['authkey']).first
    #
    #     if @integration
    #       return true
    #     else
    #       render :json => {error: t('.error'), meta: @meta}, status: 401
    #     end
    #   else
    #     render :json => {error: t('.error'), meta: @meta}, status: 401
    #   end
    # end

    def user_params
      params.require(:user).permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          :profile,
          :is_admin
      )
    end
  end
end
