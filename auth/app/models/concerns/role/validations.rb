module Concerns::Role::Validations
  extend ActiveSupport::Concern

  included do
    validates :name, :presence => true, :format => { :with => /[A-Za-z]+/},
      :length => { :in => 1..255 }, :uniqueness => true
  end
end