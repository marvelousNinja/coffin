class User < ActiveRecord::Base
	include Concerns::HasRoles
  has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :timeoutable,
         :rememberable, :trackable, :validatable, :recoverable
end
