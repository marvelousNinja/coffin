class LoanRequest < ActiveRecord::Base
  include Concerns::LoanRequest::SendsMessages
  include Concerns::LoanRequest::HasStateMachine
  has_paper_trail
end
