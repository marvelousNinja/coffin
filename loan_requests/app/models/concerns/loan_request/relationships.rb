module Concerns::LoanRequest::Relationships
  extend ActiveSupport::Concern

  included do
    has_paper_trail

    has_one :profile
    has_one :document
    has_one :registration_address, class_name: 'Address', conditions: { address_type: :registration }
    has_one :current_address, class_name: 'Address', conditions: { address_type: :current }
    has_one :job

    accepts_nested_attributes_for :profile, :document, :registration_address, :current_address, :job
  end
end