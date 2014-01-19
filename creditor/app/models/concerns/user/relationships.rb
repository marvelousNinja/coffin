module Concerns::User::Relationships
  extend ActiveSupport::Concern

  included do
    has_many :loan_agreements
  end
end