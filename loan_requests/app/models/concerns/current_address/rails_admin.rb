module Concerns::CurrentAddress::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      address_line
    end

    rails_admin do
      visible false

      edit do
        field :country
        field :zip_code
        field :address_line
        field :phone
      end
    end
  end
end