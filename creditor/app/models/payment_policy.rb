class PaymentPolicy < ActiveRecord::Base
  belongs_to :credit_product
end
