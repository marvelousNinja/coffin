module Concerns::Profile::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false

      edit do
        field :name
        field :surname
        field :middle_name
        field :previous_surname

        field :birthdate
        field :origin_country
        field :birthplace

        field :gender

        field :marital_status

        field :education

        field :email
        field :mobile_phone
      end
    end
  end
end