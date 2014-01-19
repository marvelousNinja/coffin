module Concerns::PaymentPolicy::Validations
  extend ActiveSupport::Concern

  included do
    before_validation :set_percents

    def set_percents
      unless allows_advanced_repayment?
        self.min = 0
        self.max = 0
      end
    end

    validates :max, :min, :presence => true
    validates :max, :min, :numericality => { greater_than_or_equal_to: 0.2 }, :if => :allows_advanced_repayment?
    validates :max, :min, :numericality => { equal_to: 0 }, :unless => :allows_advanced_repayment?
    validates :max, numericality: { greater_than_or_equal_to: proc { |policy| policy.min } }
  end
end