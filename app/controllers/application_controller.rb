class ApplicationController < ::APIAuth::BaseController
  protect_from_forgery with: :null_session
  before_action :check_auth

  def check_auth
    if ::Integration.check_auth(params[:authkey], request.headers['authkey'])
      true
    else
      render :json => {error: t('.error'), meta: @meta}, status: 401
    end
  end
end
