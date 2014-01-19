class LoanRequest < ActiveRecord::Base
  include Concerns::LoanRequest::Relationships
  include Concerns::LoanRequest::StateMachine
  include Concerns::LoanRequest::Enumerations
  include Concerns::LoanRequest::Validations
  include Concerns::LoanRequest::RailsAdmin
end
