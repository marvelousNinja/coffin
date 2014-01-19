module Concerns::DurationPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min.to_i} - #{max.to_i} #{period.pluralize}"
    end

    rails_admin do
      visible false

      edit do
        field :min
        field :max
        field :period
      end
    end
  end
end