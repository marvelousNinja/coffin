# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## Roles and permissions
Role.delete_all
User.delete_all

roles = Role.create! [
	{
		name: :admin,
		permissions: [
			Permission.new(action: :dashboard),
			Permission.new(action: :manage, subject: :all),
			Permission.new(action: :access, subject: :rails_admin)
		]
	}
]

users = User.create! [
	{
		email: 'admin@admin.com',
		password: 'adminadmin',
		roles: [
			Role.find_by(name: :admin)
		]
	}
]