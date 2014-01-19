module Concerns::User::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      email
    end

    rails_admin do
      list do
        field :email
        field :last_sign_in_at
        field :last_sign_in_ip
      end

      edit do
        field :email
        field :password
        field :password_confirmation
        field :roles
      end
    end
  end
end