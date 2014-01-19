module Concerns::PaymentPolicy::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "Once per #{period}, all methods"
    end

    rails_admin do
      edit do
        field :payment_methods
        field :allows_advanced_repayment
        field :min
        field :max
      end
    end
  end
end