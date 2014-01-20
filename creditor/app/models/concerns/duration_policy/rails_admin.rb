module Concerns::DurationPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min.to_i} - #{max.to_i} #{period.pluralize}"
    end

    rails_admin do
      navigation_label Policy.model_name.human :count => 2

      list do
        field :min do
          pretty_value do
            value.to_i
          end
        end
        field :max do
          pretty_value do
            value.to_i
          end
        end
        field :period
      end

      edit do
        field :min, :integer do
          formatted_value do
            value.to_i
          end
        end
        field :max, :integer do
          formatted_value do
            value.to_i
          end
        end
        field :period
      end
    end
  end
end