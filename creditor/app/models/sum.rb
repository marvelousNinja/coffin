class Sum < ActiveRecord::Base
  belongs_to :loan_agreement, :inverse_of => :sum

  validates :loan_agreement, presence: true
  validates :initial, :withdrawn, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :initial, numericality: {
    greater_than_or_equal_to: proc { |sum| sum.loan_agreement.sum_policy.min },
    less_than_or_equal_to: proc { |sum| sum.loan_agreement.sum_policy.max }
  }
end
