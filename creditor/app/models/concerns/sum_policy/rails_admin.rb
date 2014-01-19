module Concerns::SumPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min.to_i} - #{max.to_i}"
    end
    rails_admin do
      visible false

      edit do
        field :min
        field :max
      end
    end
  end
end