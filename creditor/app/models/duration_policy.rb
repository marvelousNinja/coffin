class DurationPolicy < Policy
  include Concerns::DurationPolicy::Enumerations
  include Concerns::DurationPolicy::Validations
  include Concerns::DurationPolicy::RailsAdmin
end
