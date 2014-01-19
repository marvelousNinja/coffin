class DurationPolicy < Policy
  include Concerns::Policy::Period
  include Concerns::DurationPolicy::Validations
  include Concerns::DurationPolicy::RailsAdmin
end
