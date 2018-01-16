module AdminCredentials
  extend ActiveSupport::Concern

  class_methods do
    def admin_username
      admin_credential :username
    end

    def admin_password
      admin_credential :password
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