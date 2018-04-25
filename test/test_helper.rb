ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'test_helpers/helpers'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end

class RoutesTest < ActionDispatch::IntegrationTest
  def routes
    @routes.routes.map do |route|
      {request_method: route.constraints[:request_method], path: route.path.spec.to_s.gsub('(.:format)', ''), controller: route.defaults[:controller], action: route.defaults[:action]}
    end.compact
  end

  include RouteHelpers
end

class ControllersTest < ActionDispatch::IntegrationTest
  include ResourceControllerHelpers
  include RequestHelpers
  include RailsBaseHeaders
end

class RequestsTest < ActionDispatch::IntegrationTest
  include ResourceRequestsHelpers
  include RequestHelpers
  include RailsBaseHeaders
end
