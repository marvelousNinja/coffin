module Concerns::Condition::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :permission
  end
end