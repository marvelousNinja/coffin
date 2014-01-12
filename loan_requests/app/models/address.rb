class Address < ActiveRecord::Base
  belongs_to :loan_request
  #address_type -> registration, current
end
