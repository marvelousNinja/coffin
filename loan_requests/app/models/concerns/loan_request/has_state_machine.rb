module Concerns::LoanRequest::HasStateMachine
  extend ActiveSupport::Concern

  included do
    after_create { |request| LoanRequestsSender.request_created(request) }

    state_machine :status, initial: :not_approved do
      event :approve do
        transition [:not_approved, :awaiting_for_security_check, :awaiting_for_committee_approval] => :approved
      end

      event :wait_for_security_check do
        transition [:not_approved] => :awaiting_for_security_check
      end

      event :wait_for_committee_approval do
        transition [:awaiting_for_security_check] => :awaiting_for_committee_approval
      end

      event :reject do
        transition [:awaiting_for_security_check, :awaiting_for_committee_approval] => :rejected
      end

      after_transition(:on => :approve) { |request| LoanRequestsSender.request_approved(request) }
      after_transition(:on => :reject) { |request| LoanRequestsSender.request_rejected(request) }
    end
  end
end