module Concerns::Profile::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    GENDERS = %w(
      male
      female)
    enumerize :gender, in: GENDERS, default: GENDERS.first

    MARITAL_STATUSES = %w(
      single
      widowed
      divorced
      married
      cohabiting)
    enumerize :marital_status, in: MARITAL_STATUSES, default: MARITAL_STATUSES.first

    EDUCATIONS = %w(
      preschool
      general_basic
      general_secondary
      vocational
      secondary_special
      incomplete_higher
      higher
      postgraduate)
    enumerize :education, in: EDUCATIONS, default: EDUCATIONS.first

    enumerize :origin_country, in: I18nCountrySelect::Countries::COUNTRY_CODES, default: 'BY'
  end
end