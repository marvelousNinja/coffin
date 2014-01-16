module Concerns::Policy::Relationships
  extend ActiveSupport::Concern

  included do
    has_many :credit_products
    has_many :loan_agreements, :through => :credit_products
  end
end