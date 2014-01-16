module Concerns::Policy::Relationships
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :credit_products
  end
end