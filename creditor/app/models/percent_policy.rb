class PercentPolicy < Policy
  include Concerns::PercentPolicy::Validations
  include Concerns::Policy::Period
  include Concerns::PercentPolicy::RailsAdmin
end
