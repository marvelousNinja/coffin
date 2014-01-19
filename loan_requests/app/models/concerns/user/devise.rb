module Concerns::User::Devise
  extend ActiveSupport::Concern

  included do
    devise :omniauthable, :omniauth_providers => [:centralized_auth]
  end
end