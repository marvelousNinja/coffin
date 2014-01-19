module Concerns::LoanAgreement::StateMachine
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    state_machine :status, initial: :not_approved do
      event :approve do
        transition [:not_approved] => :approved
      end

      event :cancel do
        transition [:not_approved] => :cancelled
      end
    end

    enumerize :payment_method, :in => [:annual, :differential, :percents_and_single_payment]
  end
end