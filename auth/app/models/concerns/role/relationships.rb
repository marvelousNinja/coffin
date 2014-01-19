module Concerns::Role::Relationships
  extend ActiveSupport::Concern

  included do
    has_many :permissions
    has_and_belongs_to_many :users
  end
end