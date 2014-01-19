class CreditProduct < ActiveRecord::Base
  include Concerns::CreditProduct::Relationships
  include Concerns::CreditProduct::StateMachine
  include Concerns::CreditProduct::Validations
  include Concerns::CreditProduct::RailsAdmin
end
