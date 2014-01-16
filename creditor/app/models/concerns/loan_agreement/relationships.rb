module Concerns::LoanAgreement::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :credit_product

    has_one :sum, :inverse_of => :loan_agreement
    has_one :percent, :inverse_of => :loan_agreement
    has_one :fine, :inverse_of => :loan_agreement
    has_one :duration, :inverse_of => :loan_agreement

    delegate :sum_policy, :percent_policy, :fine_policy, :duration_policy, :to => :credit_product

    accepts_nested_attributes_for :sum, :percent, :fine, :duration
  end
end