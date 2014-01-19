module Concerns::SumPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min.to_i} - #{max.to_i}"
    end

    rails_admin do
      navigation_label Policy.model_name.human :count => 2

      list do
        field :min do
          pretty_value do
            bindings[:view].try(:number_with_delimiter, value.to_i)
          end
        end

        field :max do
          pretty_value do
            bindings[:view].try(:number_with_delimiter, value.to_i)
          end
        end
      end

      edit do
        field :min, :integer
        field :max, :integer
      end
    end
  end
end