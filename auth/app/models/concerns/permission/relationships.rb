module Concerns::Permission::Relationships
  extend ActiveSupport::Concern

  included do
    belongs_to :role
    has_many :conditions
  end
end