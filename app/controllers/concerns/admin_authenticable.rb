module AdminAuthenticable
  extend ActiveSupport::Concern

  class_methods do
    def admin_username
      ENV['ADMIN_USERNAME'].tap do |username|
        raise 'Admin username is not set. Hint: set ADMIN_USERNAME environment variable.' if username.blank?
      end
    end

    def admin_password
      ENV['ADMIN_PASSWORD'].tap do |password|
        raise 'Admin password is not set. Hint: set ADMIN_PASSWORD environment variable.' if password.blank?
      end
    end

    def admin_authenticate(**options)
      default_options = { name: admin_username,
                          password: admin_password,
                          realm: 'Admin' }

      http_basic_authenticate_with default_options.merge options
    end
  end
end
