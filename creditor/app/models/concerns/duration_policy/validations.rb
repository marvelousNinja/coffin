module Concerns::DurationPolicy::Validations
  extend ActiveSupport::Concern

  included do
    validates :max, :min, :units, presence: true
    validates :units, inclusion: { in: Concerns::DurationPolicy::Enumerations::UNITS }
    validates :max, :min, numericality: { only_integer: true, greater_than: 0 }
    validates :max, numericality: { greater_than_or_equal_to: proc { |policy| policy.min } }
  end
end