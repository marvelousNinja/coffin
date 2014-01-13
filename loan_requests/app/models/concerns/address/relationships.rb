module Concerns::Address::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :loan_request, conditions: { address_type: :registration }, inverse_of: :registration_address
    belongs_to :loan_request, conditions: { address_type: :current }, inverse_of: :current_address
  end
end