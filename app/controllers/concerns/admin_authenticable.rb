module AdminAuthenticable
  extend ActiveSupport::Concern

  include AdminCredentials

  class_methods do
    def admin_authenticate(**options)
      # HTTP basic authentication breaks Capybara tests in several ways:
      #
      # 1. Capybara does not support credentials through headers, so URLs must be used
      # 2. Credentials in URLs break turbolinks and Ajax calls
      return if Rails.env.test?

      default_options = { name: admin_username,
                          password: admin_password,
                          realm: 'Admin' }

      http_basic_authenticate_with default_options.merge options
    end
  end
end
