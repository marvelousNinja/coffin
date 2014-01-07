class User < ActiveRecord::Base
	include Concerns::HasRoles
  has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :timeoutable,
         :rememberable, :trackable, :validatable, :recoverable

  devise :oauth2_providable,
    :oauth2_password_grantable,
    :oauth2_refresh_token_grantable,
    :oauth2_authorization_code_grantable
end
