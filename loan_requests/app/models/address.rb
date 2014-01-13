class Address < ActiveRecord::Base
  include Concerns::Address::Enumerations
  include Concerns::Address::Validations
  include Concerns::InvisibleModel
end
