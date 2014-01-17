module Concerns::LoanAgreement::RailsAdmin
  extend ActiveSupport::Concern

  included do
    include RailsAdminCharts

    def basic_part_graph
      'Graph'
    end

    def percent_part_graph
      'Graph'
    end

    def complete_graph
      'Graph'
    end

    rails_admin do
      edit do
        field :status, :state
        field :initial_loan_sum
        field :loan_percent
        field :duration
        field :fine_percent
        field :payment_method
        field :advanced_repayment_percent
      end

      create do
        field :status, :state do
          visible false
        end
        field :initial_loan_sum
        field :loan_percent
        field :duration
        field :fine_percent
        field :payment_method
        field :advanced_repayment_percent
        field :credit_product
      end

      show do
        field :basic_part_graph do
          formatted_value do
            bindings[:view].line_chart Payment.group_by_day(:scheduled_at).sum(:basic_part)
          end
        end

        field :percent_part_graph do
          formatted_value do
            bindings[:view].line_chart Payment.group_by_day(:scheduled_at).sum(:percent_part)
          end
        end

        field :complete_graph do
          formatted_value do
            bindings[:view].line_chart Payment.group_by_day(:scheduled_at).sum(:sum)
          end
        end
      end
    end
  end
end