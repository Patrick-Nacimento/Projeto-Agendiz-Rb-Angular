class ApplicationController < ::APIAuth::BaseController
  protect_from_forgery with: :null_session
end
