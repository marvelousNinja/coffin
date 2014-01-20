module Concerns::Document::Validations
  extend ActiveSupport::Concern

  included do
    validates :document_type, inclusion: { in: Concerns::Document::Enumerations::DOCUMENT_TYPES }
    validates :series, format: { with: /[A-Z]{2}/}, length: { is: 2 }
    validates :number, format: { with: /\d{7}/}, length: { is: 7 }
    validates :personal_number, format: { with: /\d{7}[A-Z]\d{3}[A-Z]{2}\d/ }, length: { is: 14 }
    validates :issued_by, format: { with: /([\d]*[А-Яа-я]+[\s]*)+/ }, length: { in: 5..255 }
    validates :issued_at, date: {
      :after => proc { Time.now - 10.years },
      :before => proc { Time.now }
    }
    validates :expires_at, date: {
      :after => :issued_at,
      :before => proc { Time.now + 10.years }
    }
    validates :latin_name, :latin_surname, format: { with: /([A-Za-z]+\s?)+\S\z/ }, length: { in: 5..255 }

    validates :document_type, :series, :number, :personal_number, :issued_by,
      :issued_at, :expires_at, :latin_name, :latin_surname, :loan_request, presence: true
  end
end