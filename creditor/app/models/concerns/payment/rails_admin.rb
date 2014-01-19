module Concerns::Payment::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        sort_by :scheduled_at

        field :basic_part do
          pretty_value do
            bindings[:view].try(:number_with_delimiter, value.to_i)
          end
        end
        field :percent_part do
          pretty_value do
            bindings[:view].try(:number_with_delimiter, value.to_i)
          end
        end
        field :sum do
          pretty_value do
            bindings[:view].try(:number_with_delimiter, value.to_i)
          end
        end
        field :scheduled_at
        field :processed
      end
    end
  end
end