module Concerns::User::GeneratesPassword
  extend ActiveSupport::Concern

  included do
    before_validation :generate_password

    def generate_password
      self.password ||= Devise.friendly_token.first(2)
    end
  end
end