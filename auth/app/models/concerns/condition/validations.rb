module Concerns::Condition::Validations
  extend ActiveSupport::Concern

  included do
    validates :field, :value, :presence => true, :format => { :with => /[.]+/},
      :length => { :in => 1..255 }, :uniqueness => true
  end
end