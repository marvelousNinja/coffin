module Concerns::User::HasRoles
	extend ActiveSupport::Concern

	included do
		has_and_belongs_to_many :roles
		has_many :permissions, through: :roles
	end
end