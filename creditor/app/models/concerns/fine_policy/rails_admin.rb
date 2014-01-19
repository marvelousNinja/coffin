module Concerns::FinePolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min} - #{max} %, per #{period}"
    end

    rails_admin do
      list do
        field :min
        field :max
        field :period
      end

      edit do
        field :min
        field :max
        field :period
      end
    end
  end
end