module Concerns::Document::RailsAdmin
  extend ActiveSupport::Concern

  def title
    "#{self.series} #{self.number}"
  end

  included do
    rails_admin do
      visible false
    end
  end
end