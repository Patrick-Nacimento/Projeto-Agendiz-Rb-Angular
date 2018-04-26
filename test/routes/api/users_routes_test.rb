require 'test_helper'
module API
  class UsersRoutesTest < RoutesTest

    def url
      '/api/users'
    end

    def controller
      'api/users'
    end

    test 'users routes' do
      route_array = [:index, :show, :create, :update, :destroy, :recover]
      route_assertions(url, controller, route_array)
    end

  end
end