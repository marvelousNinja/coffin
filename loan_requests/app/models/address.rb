class Address < ActiveRecord::Base
  include Concerns::Address::Relationships
  include Concerns::Address::Enumerations
  include Concerns::Address::Validations
  include Concerns::Address::RailsAdmin
end
