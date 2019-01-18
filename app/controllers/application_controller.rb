class ApplicationController < ::APIAuth::BaseController
    protect_from_forgery with: :null_session
    before_action :check_auth
  
    def check_auth
        true
    end
  end
