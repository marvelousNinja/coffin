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