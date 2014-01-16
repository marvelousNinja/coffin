class CreditProduct < ActiveRecord::Base
  belongs_to :duration_policy
  belongs_to :sum_policy
  belongs_to :percent_policy
  belongs_to :fine_policy
  belongs_to :payment_policy

  has_many :loan_agreements
end
