module Concerns::LoanRequest::Validations
  extend ActiveSupport::Concern

  included do
    validates :profile, :document, :registration_address, presence: true
    validates :current_address, :presence => true, :unless => :lives_by_registration_address?
    validates :job, :presence => true, :unless => :doesnt_have_a_job?

    validates :sum, presence: true, numericality: { only_integer: true,
      greater_than: 500_000,
      less_than: 50_000_000
    }

    validates :dependants_count, numericality: { only_integer: true,
      greater_than_or_equal_to: 0,
      less_than: 15
    }

    validates :average_income, numericality: { only_integer: true,
      greater_than_or_equal_to: 500_000,
      less_than: 50_000_000
    }

    validates :interval, presence: true, inclusion: { in: Concerns::LoanRequest::Enumerations::INTERVALS }
    validates :current_location_type, presence: true, inclusion: { in: Concerns::LoanRequest::Enumerations::LOCATION_TYPES }
  end
end