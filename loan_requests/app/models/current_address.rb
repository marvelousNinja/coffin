class CurrentAddress < Address
  include Concerns::CurrentAddress::Relationships
  include Concerns::CurrentAddress::RailsAdmin
end