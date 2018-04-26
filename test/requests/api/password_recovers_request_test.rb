require 'test_helper'
module API
  class PasswordRecoversRequestsTest < RequestsTest
    def url
      '/api/password_recovers'
    end

    test 'create' do
      # Not found user
      post("#{url}", params: {
          password_recover: {
              email: 'not_found@email.com'
          }
      })
      response_assertions(404, :equal, 'error', I18n.t('api.password_recovers.create.not_found'))

      # Success
      post("#{url}", params: {
          password_recover: {
              email: users(:one).email
          }
      })
      response_assertions(200, :equal, 'success', I18n.t('api.password_recovers.create.success'))
    end

  end
end