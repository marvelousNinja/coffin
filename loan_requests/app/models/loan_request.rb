class LoanRequest < ActiveRecord::Base
  include Concerns::LoanRequest::SendsMessages
end
