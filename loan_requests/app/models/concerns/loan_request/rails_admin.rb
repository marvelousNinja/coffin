module Concerns::LoanRequest::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "№ #{id}"
    end

    rails_admin do
      list do
        field :id
        field :sum
        field :interval
      end

      create do
        field :sum
        field :interval

        field :profile
        field :document
        field :registration_address
        field :lives_by_registration_address
        field :current_location_type
        field :current_address

        field :doesnt_have_a_job
        field :job

        field :dependants_count
        field :average_income
        field :has_a_real_estate
        field :has_a_car
      end

      edit do
        field :status, :state
        field :sum
        field :interval

        field :profile
        field :document
        field :registration_address
        field :lives_by_registration_address
        field :current_location_type
        field :current_address

        field :doesnt_have_a_job
        field :job

        field :dependants_count
        field :average_income
        field :has_a_real_estate
        field :has_a_car
      end
    end
  end
end