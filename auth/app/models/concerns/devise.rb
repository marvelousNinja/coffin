module Concerns::Devise
  extend ActiveSupport::Concern

  included do
      devise :database_authenticatable, :registerable, :lockable, :timeoutable,
             :rememberable, :trackable, :validatable, :recoverable
  end
end