module Concerns::Role::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      name
    end

    rails_admin do
      list do
        field :name
      end
    end
  end
end