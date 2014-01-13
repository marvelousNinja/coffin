module Concerns::Address::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    ADDRESS_TYPES = %w(
      registration
      current)
    enumerize :address_type, in: ADDRESS_TYPES, default: ADDRESS_TYPES.first

    enumerize :country, in: Country.all.map(&:first)
  end
end