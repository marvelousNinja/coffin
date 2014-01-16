module Concerns::LoanAgreement::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :credit_product

    delegate :sum_policy, :percent_policy, :fine_policy,
      :duration_policy, :payment_policy, :to => :credit_product
  end
end