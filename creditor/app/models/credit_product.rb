class CreditProduct < ActiveRecord::Base
  has_and_belongs_to_many :duration_policies
  has_and_belongs_to_many :sum_policies
  has_and_belongs_to_many :percent_policies
  has_and_belongs_to_many :fine_policies
  has_and_belongs_to_many :payment_policies
end
