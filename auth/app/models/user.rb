class User < ActiveRecord::Base
	include Concerns::User::HasRoles
  include Concerns::User::GeneratesPassword
  include Concerns::User::Devise
  include Concerns::User::SendsMessages
  include Concerns::User::CanBeAnonymous
  has_paper_trail
end
