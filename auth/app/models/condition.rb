class Condition < ActiveRecord::Base
  include Concerns::Condition::Relationships
  include Concerns::Condition::Validations
  include Concerns::Condition::RailsAdmin
  has_paper_trail
end
