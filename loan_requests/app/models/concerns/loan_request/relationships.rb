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
    accepts_nested_attributes_for :current_address, :reject_if => :there_is_no_need_in_current_address

    def there_is_no_need_in_current_address
      self.lives_by_registration_address
    end
  end
end