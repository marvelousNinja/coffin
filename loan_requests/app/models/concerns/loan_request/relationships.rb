module Concerns::LoanRequest::Relationships
  extend ActiveSupport::Concern

  included do
    has_paper_trail

    has_one :profile, :inverse_of => :loan_request
    has_one :document, :inverse_of => :loan_request
    has_one :registration_address, class_name: 'Address', conditions: { address_type: :registration }
    has_one :current_address, class_name: 'Address', conditions: { address_type: :current }
    has_one :job, :inverse_of => :loan_request

    accepts_nested_attributes_for :profile, :document, :registration_address, :current_address, :job
  end
end