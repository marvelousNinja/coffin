module Concerns::LoanAgreement::StateMachine
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    state_machine :status, initial: :not_approved do
      event :prepare_to_sign do
        transition [:not_approved] => :ready_to_sign
      end

      event :sign do
        transition [:ready_to_sign] => :signed
      end

      event :activate do
        transition [:approved] => :active
      end

      event :cancel do
        transition [:not_approved, :ready_to_sign, :signed, :active] => :cancelled
      end

      state :ready_to_sign, :signed, :active, :closed do
        validates :user_id, :loan_request_id, :pdf, :presence => true
      end

      state :active do
        validates :account_id, :presence => true
      end

      before_transition(:on => :prepare_to_sign) { |agreement| agreement.generate_pdf }
      after_transition(:on => :cancel) { |agreement| agreement.remove_pdf!; agreement.save }
      after_transition(:on => :sign) { |agreement| AccountsSender.create_for(agreement) }
    end

    enumerize :payment_method, :in => [:annual, :differential, :percents_and_single_payment]
  end
end