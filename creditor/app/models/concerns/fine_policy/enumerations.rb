module Concerns::FinePolicy::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    PERIODS = %w(hour day month year)
    enumerize :period, in: PERIODS
  end
end