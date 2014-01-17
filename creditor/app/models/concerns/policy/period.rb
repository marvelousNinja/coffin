module Concerns::Policy::Period
  extend ActiveSupport::Concern

  DAYS_PER_MONTH = 30
  MONTHS_PER_YEAR = 12
  PERIODS = %w(day month year)
  MULTIPLERS = {
    'day' => 1,
    'month' => DAYS_PER_MONTH,
    'year' => DAYS_PER_MONTH * MONTHS_PER_YEAR
  }

  included do
    extend Enumerize

    enumerize :period, in: PERIODS
    validates :period, presence: true, inclusion: { in: PERIODS }

    def period_in_days
      MULTIPLERS[period]
    end
  end
end