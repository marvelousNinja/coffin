module Concerns::LoanRequest::RailsAdmin
  extend ActiveSupport::Concern

  def title
    "№ #{self.id}"
  end

  included do
    rails_admin do
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