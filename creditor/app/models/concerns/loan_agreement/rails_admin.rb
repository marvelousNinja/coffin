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

    def title
      "№ #{id}"
    end

    rails_admin do
      list do
        field :user_id do
          pretty_value do
            bindings[:object].try(:user_id)
          end
        end
        field :initial_loan_sum do
          pretty_value do
            bindings[:view].try(:number_with_delimiter, value.to_i)
          end
        end
        field :loan_percent do
          pretty_value do
            value.to_s + ' %'
          end
        end
        field :duration do
          pretty_value do
            value.to_i
          end
        end
      end

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
        field :pdf, :carrierwave
        # field :basic_part_graph do
        #   formatted_value do
        #     bindings[:view].line_chart Payment.group_by_day(:scheduled_at).sum(:basic_part)
        #   end
        # end

        # field :percent_part_graph do
        #   formatted_value do
        #     bindings[:view].line_chart Payment.group_by_day(:scheduled_at).sum(:percent_part)
        #   end
        # end

        # field :complete_graph do
        #   formatted_value do
        #     bindings[:view].line_chart Payment.group_by_day(:scheduled_at).sum(:sum)
        #   end
        # end
      end
    end
  end
end