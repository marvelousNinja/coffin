class LoanAgreement < ActiveRecord::Base
  include Concerns::LoanAgreement::Relationships
  include Concerns::LoanAgreement::Validations

  after_initialize :set_default_values

  def set_default_values
    if new_record?
      self.credit_product ||= CreditProduct.last
      self.initial_loan_sum ||= sum_policy.max.to_i
      self.loan_percent ||= percent_policy.max.to_i
      self.duration ||= duration_policy.max.to_i
      self.fine_percent ||= fine_policy.max
      self.payment_method ||= payment_policy.payment_methods.first
      self.advanced_repayment_percent ||= payment_policy.max
    end
  end
end