module Concerns::User::Relationships
  extend ActiveSupport::Concern

  included do
    has_many :loan_agreements
    has_paper_trail
  end
end