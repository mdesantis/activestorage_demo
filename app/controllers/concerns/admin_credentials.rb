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
      credential_key = :"admin_#{credential_name}"

      credential = ENV.fetch(credential_key.upcase.to_s) do
        Rails.application.credentials.dig(Rails.env.to_sym, credential_key)
      end

      if credential.blank?
        raise <<~ERR
          Admin #{credential_name} is not set. Hints:

          - run `bin/rails credentials:edit` and set:

          #{Rails.env}:
            admin_#{credential_name}:

          - set #{credential_key.upcase} environment variable
        ERR
      end

      credential
    end
  end
end
