module Concerns::LoanAgreement::Relationships
  extend ActiveSupport::Concern

  included do
    has_many :payments
    belongs_to :credit_product
    belongs_to :user

    delegate :sum_policy, :percent_policy, :fine_policy, :duration_policy, :payment_policy, :to => :credit_product
  end
end