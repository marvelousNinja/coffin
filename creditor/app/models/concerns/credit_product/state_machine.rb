module Concerns::CreditProduct::StateMachine
  extend ActiveSupport::Concern

  included do
    state_machine :status, initial: :inactive do
      event :activate do
        transition [:inactive] => :active
      end

      event :deactivate do
        transition [:active] => :inactive
      end
    end
  end
end