module Concerns::LoanRequest::Relationships
  extend ActiveSupport::Concern

  included do
    has_paper_trail

    has_one :profile, :inverse_of => :loan_request
    has_one :document, :inverse_of => :loan_request
    has_one :registration_address, :inverse_of => :loan_request
    has_one :current_address, :inverse_of => :loan_request
    has_one :job, :inverse_of => :loan_request

    accepts_nested_attributes_for :profile, :document, :registration_address, :job
    accepts_nested_attributes_for :current_address, reject_if: proc { true }
  end
end