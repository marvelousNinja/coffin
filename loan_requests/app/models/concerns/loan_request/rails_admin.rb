module Concerns::LoanRequest::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :sum
        field :interval

        field :profile
        field :document
        field :registration_address
        field :lives_by_registration_address
        field :current_location_type
        field :current_address
        field :job

        field :dependants_count
        field :average_income
        field :has_a_real_estate
        field :has_a_car
      end
    end
  end
end