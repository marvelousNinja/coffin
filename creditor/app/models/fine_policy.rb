class FinePolicy < Policy
  include Concerns::FinePolicy::Enumerations
  include Concerns::FinePolicy::Validations
  include Concerns::FinePolicy::RailsAdmin
end
