class Profile < ActiveRecord::Base
  include Concerns::Profile::Relationships
  include Concerns::Profile::Enumerations
  include Concerns::Profile::Validations
  include Concerns::Profile::RailsAdmin
end
