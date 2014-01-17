class FinePolicy < Policy
  include Concerns::FinePolicy::Validations
  include Concerns::Policy::Period
  include Concerns::FinePolicy::RailsAdmin
end
