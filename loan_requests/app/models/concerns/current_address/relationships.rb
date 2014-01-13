module Concerns::CurrentAddress::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :loan_request, :inverse_of => :current_address
  end
end