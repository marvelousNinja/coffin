module Concerns::PaymentPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "Once per #{period}, all methods"
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
        field :allows_advanced_repayment
      end

      edit do
        field :min
        field :max
        field :payment_methods
        field :allows_advanced_repayment
      end
    end
  end
end