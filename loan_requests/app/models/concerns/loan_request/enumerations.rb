module Concerns::LoanRequest::Enumerations
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    INTERVALS = %w(
      several_months
      half_year
      one_year
      several_years)
    enumerize :interval, in: INTERVALS, default: INTERVALS.first

    LOCATION_TYPES = %w(
      owning_a_flat
      owning_a_house
      with_relatives
      renting
      other)

    enumerize :current_location_type, in: LOCATION_TYPES, default: LOCATION_TYPES.first

    enumerize :status_event, in: self.state_machines[:status].events.map(&:name)

    def status_event_enum
      self.class.enumerized_attributes[:status_event].options.keep_if { |pair| self.status_events.map(&:to_s).include? pair[1] }
    end
  end
end