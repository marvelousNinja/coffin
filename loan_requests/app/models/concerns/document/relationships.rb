module Concerns::Document::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :loan_request, :inverse_of => :document
  end
end