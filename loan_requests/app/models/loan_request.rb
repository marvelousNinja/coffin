class LoanRequest < ActiveRecord::Base
  include Concerns::LoanRequest::HasStateMachine
  include Concerns::LoanRequest::Relationships
  include Concerns::LoanRequest::Enumerations
  include Concerns::LoanRequest::Validations
  include Concerns::LoanRequest::RailsAdmin
end
