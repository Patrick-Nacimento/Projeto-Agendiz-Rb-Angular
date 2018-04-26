module API
  class PasswordRecoversController < ::APIAuth::BaseController
    skip_before_action :require_authentication
    before_action :require_no_authentication

    def create
      user = ::User.find_by(email: create_params[:email])

      unless user
        return render_json_message({error: t('.not_found')}, 404)
      end

      token = user.generate_password_recover
      if token
        render_json_message({success: t('.success'), token: token}, 200)
      else
        render_json_message({errors: user.errors.messages}, 404)
      end
    end

    def update
      user = ::User.reset_password_by_token(update_params)

      if user and user.errors.size == 0
        render_json_message({success: t('.success')}, 200)
      else
        render_json_message({errors: user.errors.messages}, 404)
      end
    end

    private

    def create_params
      params.require(:password_recover).permit(:email)
    end

    def update_params
      params.require(:password_recover).permit(:reset_password_token, :password, :password_confirmation)
    end
  end
end