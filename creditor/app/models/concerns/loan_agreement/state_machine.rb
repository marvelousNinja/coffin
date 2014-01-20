module Concerns::LoanAgreement::StateMachine
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    state_machine :status, initial: :not_approved do
      event :prepare_to_sign do
        transition [:not_approved] => :ready_to_sign
      end

      event :signed do
        transition [:ready_to_sign] => :signed
      end

      event :approve do
        transition [:signed] => :approved
      end

      event :activate do
        transition [:approved] => :active
      end

      event :close do
        transition [:active] => :closed
      end

      event :cancel do
        transition [:not_approved, :ready_to_sign, :signed, :approved, :active] => :cancelled
      end

      after_transition(:on => :ready_to_sign) { |agreement| agreement.generate_pdf }
      after_transition(:on => :cancel) { |agreement| agreement.remove_pdf!; agreement.save }
      after_transition(:on => :approve) { |agreement| }#AccountsSender.create_for(agreement) }
    end

    enumerize :payment_method, :in => [:annual, :differential, :percents_and_single_payment]
  end
end