require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  include AdminCredentials

  delegate :admin_username, :admin_password, to: :class

  def admin_auth_headers
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials(
      admin_username, admin_password
    )

    { 'Authorization' => credentials }
  end
end
