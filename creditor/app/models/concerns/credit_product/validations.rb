module Concerns::CreditProduct::Validations
  extend ActiveSupport::Concern

  included do
    validates :name, :presence => true, :uniqueness => true, format: { with: /[- A-Za-zа-яА-Я\d]+/ }, length: { :in => 4..255 }
    validates :duration_policy, :sum_policy, :percent_policy, :fine_policy, :payment_policy, :presence => true
  end
end