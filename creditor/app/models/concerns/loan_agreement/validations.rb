module Concerns::LoanAgreement::Validations
  extend ActiveSupport::Concern

  included do
    validate :credit_product, presence: true
  end
end