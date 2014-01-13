module Concerns::Job::Validations
  extend ActiveSupport::Concern

  included do
    validates :company_name,  format: { with: /[-'"\dА-Яа-я]{3,}/ }, length: { in: 3..255 }
    validates :upid, format: { with: /\d{9}/ }, length: { is: 9 }
    validates :working_phone, :personnel_department_phone, :accounting_department_phone,
      format: { with: /\+(\d{3}){4}/ }, length: { is: 13 }
    validates :position, format: { with: /[-\dА-Яа-я]{3,}/}, length: { in: 3..255 }
    validates :employed_at, date: {
      before: Proc.new { Time.now },
      after: Proc.new { 50.years.ago }
    }

    validates :company_name, :upid, :working_phone, :accounting_department_phone,
      :personnel_department_phone, :position, :employed_at, :loan_request, presence: true
  end
end