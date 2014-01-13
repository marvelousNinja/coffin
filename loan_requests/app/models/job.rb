class Job < ActiveRecord::Base
  include Concerns::Job::Relationships
  include Concerns::Job::Validations
  include Concerns::Job::RailsAdmin
end
