module Concerns::Job::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :loan_request, :inverse_of => :job
  end
end