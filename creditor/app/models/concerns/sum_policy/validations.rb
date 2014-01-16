module Concerns::SumPolicy::Validations
  extend ActiveSupport::Concern

  included do
    validates :max, :min, presence: true
    validates :max, :min, numericality: { only_integer: true, greater_than_or_equal_to: 500_000 }
    validates :max, numericality: { greater_than_or_equal_to: proc { |policy| policy.min } }
  end
end