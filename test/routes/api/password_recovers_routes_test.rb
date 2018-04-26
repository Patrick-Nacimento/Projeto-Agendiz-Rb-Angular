require 'test_helper'
class PasswordRecoversRoutesTest < RoutesTest

  def url
    '/api/password_recovers'
  end

  def controller
    'api/password_recovers'
  end

  test 'password_recovers routes' do
    route_array = [:create]

    route_assertions(url, controller, route_array)
  end

end