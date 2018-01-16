module AdminAuthenticable
  extend ActiveSupport::Concern

  include AdminCredentials

  class_methods do
    def admin_authenticate(**options)
      default_options = { name: admin_username,
                          password: admin_password,
                          realm: 'Admin' }

      http_basic_authenticate_with default_options.merge options
    end
  end
end
