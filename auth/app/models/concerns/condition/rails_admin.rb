module Concerns::Condition::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{field} => #{value}"
    end

    rails_admin do
      list do
        field :field
        field :value
      end

      edit do
        field :field
        field :value
      end
    end
  end
end