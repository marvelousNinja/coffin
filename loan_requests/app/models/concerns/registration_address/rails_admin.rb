module Concerns::RegistrationAddress::RailsAdmin
  extend ActiveSupport::Concern

  def title
    self.address_line
  end

  included do
    rails_admin do
      visible false

      edit do
        field :country
        field :zip_code
        field :address_line
        field :registered_at
        field :phone
      end
    end
  end
end