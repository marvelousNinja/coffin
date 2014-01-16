class CreditProduct < ActiveRecord::Base
  has_many :duration_policies
  has_many :sum_policies
  has_many :percent_policies
  has_many :fine_policies
  has_many :payment_policies
end
