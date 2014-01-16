class PercentPolicy < Policy
  include Concerns::PercentPolicy::Enumerations
  include Concerns::PercentPolicy::Validations
  include Concerns::PercentPolicy::RailsAdmin
end
