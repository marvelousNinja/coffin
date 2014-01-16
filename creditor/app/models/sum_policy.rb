class SumPolicy < Policy
  include Concerns::SumPolicy::Relationships
  include Concerns::SumPolicy::Validations
  include Concerns::SumPolicy::RailsAdmin
end
