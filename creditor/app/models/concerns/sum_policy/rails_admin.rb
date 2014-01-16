module Concerns::SumPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false

      edit do
        field :min
        field :max
      end
    end
  end
end