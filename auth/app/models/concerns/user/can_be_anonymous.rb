module Concerns::User::CanBeAnonymous
  extend ActiveSupport::Concern

  included do
    def self.anonymous
      binding.pry
      User.find_by email: 'anonymous@mail.com'
    end
  end
end