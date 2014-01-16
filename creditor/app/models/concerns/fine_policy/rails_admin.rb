module Concerns::FinePolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
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