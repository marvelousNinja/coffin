module Concerns::LoanAgreement::Validations
  extend ActiveSupport::Concern

  included do
    validates :credit_product, :presence => true

    validates :initial_loan_sum, :presence => true, :numericality => {
      only_integer: true,
      greater_than_or_equal_to: proc { |agreement| agreement.sum_policy.min },
      less_than_or_equal_to: proc { |agreement| agreement.sum_policy.max }
    }, :if => proc { |agreement| agreement.credit_product.present? }

    validates :loan_percent, :presence => true, :numericality => {
      greater_than_or_equal_to: proc { |agreement| agreement.percent_policy.min },
      less_than_or_equal_to: proc { |agreement| agreement.percent_policy.max }
    }, :if => proc { |agreement| agreement.credit_product.present? }

    validates :duration, :presence => true, :numericality => {
      only_integer: true,
      greater_than_or_equal_to: proc { |agreement| agreement.duration_policy.min },
      less_than_or_equal_to: proc { |agreement| agreement.duration_policy.max }
    }, :if => proc { |agreement| agreement.credit_product.present? }

    validates :fine_percent, :presence => true, :numericality => {
      greater_than_or_equal_to: proc { |agreement| agreement.fine_policy.min },
      less_than_or_equal_to: proc { |agreement| agreement.fine_policy.max }
    }, :if => proc { |agreement| agreement.credit_product.present? }

    validates :payment_method, :presence => true, :inclusion => {
      :in => proc { |agreement| agreement.payment_policy.payment_methods }
    }, :if => proc { |agreement| agreement.credit_product.present? }

    validates :advanced_repayment_percent, :presence => true, :numericality => {
      greater_than_or_equal_to: proc { |agreement| agreement.payment_policy.min },
      less_than_or_equal_to: proc { |agreement| agreement.payment_policy.max }
    }, :if => proc { |agreement| agreement.credit_product.present? && agreement.payment_policy.allows_advanced_repayment }
  end
end