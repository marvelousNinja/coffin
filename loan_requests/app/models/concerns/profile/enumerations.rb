module Concerns::Profile::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    GENDERS = ['male', 'female']
    enumerize :gender, in: GENDERS, default: GENDERS.first

    MARITAL_STATUSES = ['single', 'widowed', 'divorced', 'married', 'cohabiting']
    enumerize :marital_status, in: MARITAL_STATUSES, default: MARITAL_STATUSES.first

    EDUCATIONS = [
      'preschool', 'general_basic', 'general_secondary', 'vocational',
      'secondary_special', 'incomplete_higher', 'higher', 'postgraduate']
    enumerize :education, in: EDUCATIONS, default: EDUCATIONS.first

    enumerize :origin_country, in: Country.all.map(&:first)
  end
end