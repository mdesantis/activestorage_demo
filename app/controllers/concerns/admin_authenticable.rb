module AdminAuthenticable
  extend ActiveSupport::Concern

  class_methods do
    def admin_username
      admin_credential :username
    end

    def admin_password
      admin_credential :password
    end

    def admin_authenticate(**options)
      default_options = { name: admin_username,
                          password: admin_password,
                          realm: 'Admin' }

      http_basic_authenticate_with default_options.merge options
    end

    private

    def admin_credential(credential_name)
      Rails.application.credentials.dig(Rails.env.to_sym, :"admin_#{credential_name}").tap do |credential|
        if credential.blank?
          raise <<~ERR
            Admin #{credential_name} is not set. Hint: run `bin/rails credentials:edit` and set:

            #{Rails.env}:
              admin_#{credential_name}:

          ERR
        end
      end
    end
  end
end
