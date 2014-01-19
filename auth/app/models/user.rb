class User < ActiveRecord::Base
	include Concerns::User::HasRoles
  include Concerns::User::GeneratesPassword
  include Concerns::User::Devise
  include Concerns::User::SendsMessages
  include Concerns::User::CanBeAnonymous
  include Concerns::User::RailsAdmin
  has_paper_trail
end
