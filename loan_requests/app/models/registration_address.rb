class RegistrationAddress < Address
  include Concerns::RegistrationAddress::Relationships
  include Concerns::RegistrationAddress::Validations
  include Concerns::RegistrationAddress::RailsAdmin
end