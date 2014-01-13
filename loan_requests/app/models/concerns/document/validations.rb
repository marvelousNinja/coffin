module Concerns::Document::Validations
  extend ActiveSupport::Concern

  # TODO: Validations of personal number can be more... accurate.
  # Also, I need to think about issuing/expiration dates.
  # ... Document type should change the way we validate numbers and series
  included do
    validates :document_type, inclusion: { in: Concerns::Document::Enumerations::DOCUMENT_TYPES }
    validates :series, format: { with: /[A-Z]{2}/}, length: { is: 2 }
    validates :number, format: { with: /\d{7}/}, length: { is: 7 }
    validates :personal_number, format: { with: /\d{7}[A-Z]\d{3}[A-Z]{2}\d/ }, length: { is: 14 }
    validates :issued_by, format: { with: /([\d]*[А-Яа-я]+[\s]*)+/ }, length: { in: 5..255 }
    validates :issued_at, date: true
    validates :expires_at, date: true
    validates :latin_name, :latin_surname, format: { with: /([A-Za-z]+\s?)+\S\z/ }

    validates :document_type, :series, :number, :personal_number, :issued_by,
      :issued_at, :expires_at, :latin_name, :latin_surname, :loan_request, presence: true
  end
end