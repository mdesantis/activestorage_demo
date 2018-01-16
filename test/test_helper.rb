require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def set_admin_auth_headers
    username = ApplicationController.admin_username
    password = ApplicationController.admin_password
    encoded_credentials = Base64.encode64("#{username}:#{password}")

    @auth_headers = { 'Authorization' => "Basic #{encoded_credentials}" }
  end
end
