module Concerns::Job::RailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :company_name
        field :upid
        field :working_phone
        field :personnel_department_phone
        field :accounting_department_phone
        field :position
        field :employed_at
      end
    end
  end
end
