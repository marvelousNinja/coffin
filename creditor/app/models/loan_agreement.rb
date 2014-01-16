class LoanAgreement < ActiveRecord::Base
  include Concerns::LoanAgreement::Relationships
  include Concerns::LoanAgreement::Validations
end