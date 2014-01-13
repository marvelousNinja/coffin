module Concerns::RegistrationAddress::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :loan_request, :inverse_of => :registration_address
  end
end