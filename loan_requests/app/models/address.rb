class Address < ActiveRecord::Base
  include Concerns::InvisibleModel
  belongs_to :loan_request
  #address_type -> registration, current
end
