module Concerns::User::GeneratesPassword
  extend ActiveSupport::Concern

  included do
    attr_accessor :generated_password

    before_validation :generate_password

    def generate_password(force = false)
      if force || (!password)
        self.generated_password = Devise.friendly_token.first(8)
        self.password = generated_password
      end
    end
  end
end