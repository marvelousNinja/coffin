module Concerns::PercentPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min} - #{max} %, per #{period}"
    end

    rails_admin do
      visible false

      edit do
        field :min
        field :max
        field :period
        field :fixed
      end
    end
  end
end