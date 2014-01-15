class Permission < ActiveRecord::Base
	belongs_to :role
  has_many :conditions
end
