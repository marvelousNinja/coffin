class PaymentPolicy < Policy
  include Concerns::PaymentPolicy::Validations
  include Concerns::Policy::Period
  include Concerns::PaymentPolicy::RailsAdmin
end