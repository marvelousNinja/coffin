module Concerns::GeneratesPassword
  extend ActiveSupport::Concern

  included do
    attr_accessor :generated_password

    before_validation :generate_password

    def generate_password
      @generated_password = Devise.friendly_token.first(8)
      self.password = @generated_password
      self.password_confirmation = @generated_password
    end
  end
end