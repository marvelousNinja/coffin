module Concerns::Address::Validations
  extend ActiveSupport::Concern

  included do
    validates :address_type, :country, :zip_code, :address_line, :phone, :presence => true

    validates :address_type, inclusion: { in: Concerns::Address::Enumerations::ADDRESS_TYPES }
    validates :country, inclusion: { in: Country.all.map(&:first) }
    validates :zip_code, format: { with: /[\d]{6}/ }, length: { is: 6 }
    validates :address_line, format: { with: /([\d]*[А-Яа-я]+[\s]*)+/ }, length: { in: 5..255 }
    validates :phone, format: { with: /\+(\d{3}){4}/}, length: { is: 13 }

    before_validation :remove_whitespace_from_phone

    def remove_whitespace_from_phone
      self.phone = phone.try(:gsub, /\s/, '')
    end
  end
end