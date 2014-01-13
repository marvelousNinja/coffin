module Concerns::Address::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false

      edit do
        field :country
        field :zip_code
        field :address_line
        field :registered_at do
          visible do
            if (obj = bindings[:object]) && obj.is_a?(Address) && obj.address_type.current?
              false
            else
              true
            end
          end
        end
        field :phone
      end
    end
  end
end