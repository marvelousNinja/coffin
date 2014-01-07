module Concerns::HasRoles
	extend ActiveSupport::Concern

	included do
		has_many :roles
		has_many :permissions, through: :roles
	end
end