module Concerns::Document::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      "#{series} #{number}"
    end

    rails_admin do
      visible false
    end
  end
end