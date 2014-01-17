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
Condition.delete_all
Doorkeeper::Application.delete_all

roles = Role.create! [
	{
		name: :admin,
		permissions: [
			Permission.new(action: :dashboard),
			Permission.new(action: :manage, subject: :all),
			Permission.new(action: :access, subject: :rails_admin)
		]
	},
  {
    name: :anonymous,
    permissions: [
      Permission.new(action: :dashboard),
      Permission.new(action: :access, subject: :rails_admin),
      Permission.new(action: :create, subject: 'LoanRequest')
    ]
  },
  {
    name: :security,
    permissions: [
      Permission.new(action: :dashboard),
      Permission.new(action: :access, subject: :rails_admin),
      Permission.new(action: :state, subject: 'LoanRequest'),
      Permission.new(action: :all_events, subject: 'LoanRequest'),
      Permission.new(action: :index, subject: 'LoanRequest',
        conditions: [
          Condition.new(field: :status, value: :awaiting_for_security_check)
        ]
      ),
      Permission.new(action: :update, subject: 'LoanRequest',
        conditions: [
          Condition.new(field: :status, value: :awaiting_for_security_check)
        ]
      ),
      Permission.new(action: :security_process, subject: 'LoanRequest',
        conditions: [
          Condition.new(field: :status, value: :awaiting_for_security_check)
        ]
      )
    ]
  },
  {
    name: :committee,
    permissions: [
      Permission.new(action: :dashboard),
      Permission.new(action: :access, subject: :rails_admin),
      Permission.new(action: :index, subject: 'LoanRequest'),
      Permission.new(action: :update, subject: 'LoanRequest'),
      Permission.new(action: :state, subject: 'LoanRequest'),
      Permission.new(action: :all_events, subject: 'LoanRequest')
    ]
  }
]

users = User.create! [
	{
		email: 'admin@mail.com',
		password: 'adminadmin',
		roles: [
			Role.find_by(name: :admin)
		]
	},
  {
    email: 'anonymous@mail.com',
    password: 'anonymous',
    roles: [
      Role.find_by(name: :anonymous)
    ]
  },
  {
    email: 'security@mail.com',
    password: 'security',
    roles: [
      Role.find_by(name: :security)
    ]
  },
  {
    email: 'committee@mail.com',
    password: 'committee',
    roles: [
      Role.find_by(name: :committee)
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
  },
  {
    name: 'Creditor',
    redirect_uri: 'http://localhost:3001/users/auth/centralized_auth/callback',
    uid: '6e8e203a411feefb4ea2124960659b0cb8eae706382b8530843f26af0662d768',
    secret: 'c4b545923ffc1526ece575cafd4d8bc801909e9ee3504c89ed0b92694ac50777'
  },
  {
    name: 'Accounts',
    redirect_uri: 'http://localhost:3004/users/auth/centralized_auth/callback',
    uid: '055a274bb0f5f7e0950690f724f92f0ebaf715d09fb50acc6f30f59f156f3139',
    secret: '3ea3aa965e206b99fc3673bc26b42972c66e8be714825db1fb61944dc66e8fd9'
  }

]

applications.each do |params|
  obj = Doorkeeper::Application.create(params)
  obj.update_attributes(params)
end