module Concerns::FinePolicy::Validations
  extend ActiveSupport::Concern

  included do
    validates :max, :min, :period, presence: true
    validates :period, inclusion: { in: Concerns::FinePolicy::Enumerations::PERIODS }
    validates :max, :min, numericality: { greater_than_or_equal_to: 0.2 }
    validates :max, numericality: { greater_than_or_equal_to: proc { |policy| policy.min } }
  end
end