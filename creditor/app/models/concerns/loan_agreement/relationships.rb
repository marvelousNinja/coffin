module Concerns::LoanAgreement::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :credit_product
  end
end