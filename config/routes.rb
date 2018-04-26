Rails.application.routes.draw do
  namespace 'api', :defaults => {format: :json} do
    resource :password_recovers, only: [:create, :update]

  end
end
