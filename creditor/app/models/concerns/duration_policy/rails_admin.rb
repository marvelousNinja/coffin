module Concerns::DurationPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false

      edit do
        field :min
        field :max
        field :units
      end
    end
  end
end