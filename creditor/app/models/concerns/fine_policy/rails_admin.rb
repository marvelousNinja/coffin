module Concerns::FinePolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{min} - #{max} %, per #{period}"
    end

    rails_admin do
      navigation_label Policy.model_name.human :count => 2

      list do
        field :min do
          pretty_value do
            value.to_s + ' %'
          end
        end
        field :max do
          pretty_value do
            value.to_s + ' %'
          end
        end
        field :period
      end

      edit do
        field :min
        field :max
        field :period
      end
    end
  end
end