module Concerns::User::CanBeAnonymous
  extend ActiveSupport::Concern

  included do
    def self.anonymous
      User.find_by email: 'anonymous@mail.com'
    end
  end
end