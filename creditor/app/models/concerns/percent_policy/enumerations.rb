module Concerns::PercentPolicy::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    PERIODS = %i(hour day month year)
    enumerize :period, in: PERIODS
  end
end