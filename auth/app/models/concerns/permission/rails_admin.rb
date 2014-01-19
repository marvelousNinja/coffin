module Concerns::Permission::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      title = "#{action}"
      title << " on #{subject}" if subject
      title << " with conditions" if conditions.present?
      title.humanize
    end

    rails_admin do
      list do
        field :title
      end

      edit do
        field :action
        field :subject
        field :owning_required
        field :conditions
        field :subject_id
      end
    end
  end
end