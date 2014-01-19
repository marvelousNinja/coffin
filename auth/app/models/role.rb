class Role < ActiveRecord::Base
  include Concerns::Role::Relationships
  include Concerns::Role::Validations
  include Concerns::Role::RailsAdmin
  has_paper_trail
end
