class User < ActiveRecord::Base
	include Concerns::HasRoles
  include Concerns::GeneratesPassword
  include Concerns::Devise
  include Concerns::SendsMessages
  has_paper_trail
end
