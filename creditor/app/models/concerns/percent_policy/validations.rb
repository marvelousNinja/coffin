module Concerns::PercentPolicy::Validations
  extend ActiveSupport::Concern

  included do
    validates :max, :min, :period, presence: true
    validates :period, inclusion: { in: Concerns::PercentPolicy::Enumerations::PERIODS }
    validates :max, :min, numericality: { greater_than_or_equal_to: 20 }
    validates :max, numericality: { greater_than_or_equal_to: proc { |policy| policy.min } }
  end
end