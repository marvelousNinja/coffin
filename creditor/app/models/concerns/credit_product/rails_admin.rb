module Concerns::CreditProduct::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      name
    end

    rails_admin do
      edit do
        field :status, :state
        field :name
        field :duration_policy
        field :sum_policy
        field :percent_policy
        field :fine_policy
        field :payment_policy
      end

      list do
        field :name
        field :status
      end
    end
  end
end