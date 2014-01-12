class LoanRequest < ActiveRecord::Base
  include Concerns::LoanRequest::HasStateMachine
  include Concerns::LoanRequest::Relationships
end
