module Concerns::DurationPolicy::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    UNITS = %i(days months years)
    enumerize :units, in: UNITS
  end
end