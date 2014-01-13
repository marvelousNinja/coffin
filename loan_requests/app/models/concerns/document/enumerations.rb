module Concerns::Document::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    DOCUMENT_TYPES = %w(
      passport
      residence permit)
    enumerize :document_type, in: DOCUMENT_TYPES, default: DOCUMENT_TYPES.first
  end
end