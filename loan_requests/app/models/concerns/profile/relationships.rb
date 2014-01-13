module Concerns::Profile::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :loan_request, :inverse_of => :profile
  end
end