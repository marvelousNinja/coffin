module Concerns::PdfTemplate::RailsAdmin
  extend ActiveSupport::Concern

  included do
    def title
      path
    end

    rails_admin do
      list do
        field :path
        field :body
        field :format
        field :locale
        field :handler
        field :partial
      end

      edit do
        field :body, :ck_editor
        field :path
        field :format
        field :locale
        field :handler
        field :partial
      end
    end
  end
end