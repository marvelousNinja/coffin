class Permission < ActiveRecord::Base
	include Concerns::Permission::Relationships
  include Concerns::Permission::Validations
  include Concerns::Permission::RailsAdmin
  has_paper_trail
end
