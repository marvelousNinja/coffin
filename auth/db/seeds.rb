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
Permission.delete_all
Doorkeeper::Application.delete_all

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

applications = [
	{
    name: 'Notificator',
    redirect_uri: 'http://localhost:3002/users/auth/centralized_auth/callback',
    uid: 'e7a1c7352cd75495632952541c5c4b58f48e4b3d88f73462b73e85ed0a91d21b',
    secret: '6326006f72d65ad48e5d70047ec7e42cdcf6f627f54459350107d5ffec277cdb'
	},
  {
    name: 'Loan Requests',
    redirect_uri: 'http://localhost:3003/users/auth/centralized_auth/callback',
    uid: '5010e13ff2c42dce1cb1f76e406593bced8813799436e01ab23407317eec8747',
    secret: 'e2ceabd3d63f63af2b40248d2570e6efc5121be36456e6afc87c5c96d8235a7b'
  }
]

applications.each do |params|
  obj = Doorkeeper::Application.create(params)
  obj.update_attributes(params)
end