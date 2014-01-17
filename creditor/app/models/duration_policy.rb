class DurationPolicy < Policy
  include Concerns::DurationPolicy::Validations
  include Concerns::Policy::Period
  include Concerns::DurationPolicy::RailsAdmin
end
