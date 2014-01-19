module Concerns::Condition::Validations
  extend ActiveSupport::Concern

  included do
    validates :field, :value, :presence => true, :format => { :with => /[\S\s]+/},
      :length => { :in => 1..255 }
  end
end