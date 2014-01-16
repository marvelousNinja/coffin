module Concerns::Policy::Relationships
  extend ActiveSupport::Concern

  included do
    has_many :credit_products
  end
end