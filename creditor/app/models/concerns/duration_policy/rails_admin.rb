module Concerns::DurationPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min.to_i} - #{max.to_i} #{period.pluralize}"
    end

    rails_admin do
      list do
        field :min, :integer
        field :max, :integer
        field :period
      end

      edit do
        field :min, :integer
        field :max, :integer
        field :period
      end
    end
  end
end