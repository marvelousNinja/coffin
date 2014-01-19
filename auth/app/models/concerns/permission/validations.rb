module Concerns::Permission::Validations
  extend ActiveSupport::Concern

  included do
    validates :action, :presence => true
    validates :action, :subject, :format => { :with => /[A-Za-z]+/ },
      :length => { :in => 1..255 }
    validates :subject_id, :allow_blank => true, :numericality => { :only_integer => true, :greater_than => 0 }
  end
end