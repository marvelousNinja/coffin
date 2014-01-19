module Concerns::PaymentPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "Once per #{period}, all methods"
    end

    rails_admin do
      list do
        field :min
        field :max
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