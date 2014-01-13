class Profile < ActiveRecord::Base
  extend Enumerize

  belongs_to :loan_request

  GENDERS = [:male, :female]
  enumerize :gender, in: GENDERS, default: GENDERS.first

  MARITAL_STATUSES = [:single, :widowed, :divorced, :married, :cohabiting]
  enumerize :marital_status, in: MARITAL_STATUSES, default: MARITAL_STATUSES.first

  EDUCATIONS = [
    :preschool, :general_basic, :general_secondary, :vocational,
    :secondary_special, :incomplete_higher, :higher, :postgraduate]
  enumerize :education, in: EDUCATIONS, default: EDUCATIONS.first

  enumerize :origin_country, in: Country.all

  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :marital_status, presence: true, inclusion: { in: MARITAL_STATUSES }
  validates :education, presence: true, inclusion: { in: EDUCATIONS }
  validates :origin_country, presence: true, inclusion: { in: Country.all }

  validates :name, :middle_name, :surname, :previous_surname,
    format: { with: /\A((([доДО]')?[А-Я])?[а-я]{1,}(-[А-Яа-я]{2,})?[ ]?)+\S\z/},
    length: { in: 1..50 }
  validates :name, :middle_name, :surname, presence: true
  validates :previous_surname, allow_blank: true

  validates :birthdate, presence: true, date: {
    after: Proc.new { Time.now - 90.years },
    before: Proc.new { Time.now - 21.year }
  }

  validates :birthplace, presence: true, format: { with: /([\d]*[А-Яа-я]+[\s]*)+/ }, length: { in: 5..255 }
  validates :marital_status, presence: true, inclusion: { in: MARITAL_STATUSES }
  validates :mobile_phone, presence: true, format: { with: /\+(\d{3}){4}/}, length: { is: 13 }
  validates :email, presence: true, format: { with: Devise.email_regexp }, length: { in: 3..255 }
  validates :loan_request, presence: true

  before_validation :remove_whitespace_from_phone

  def remove_whitespace_from_phone
    self.mobile_phone = mobile_phone.try(:gsub, /\s/, '')
  end
end
