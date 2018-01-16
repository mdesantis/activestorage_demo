require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def admin_credentials
    { username: ApplicationController.admin_username, password: ApplicationController.admin_password }
  end

  def admin_auth_headers
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials(
      admin_credentials[:username], admin_credentials[:password]
    )

    { 'Authorization' => credentials }
  end
end
