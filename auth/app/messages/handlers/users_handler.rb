class UsersHandler
  include MqConnector::Handler

  listen_to :users, :as => :auth_handler_for_users

  on :create_for do |client_data|
    email = client_data.fetch('email')

    user = User.find_or_initialize_by email: email
    user.save

    UsersSender.created_for(user, client_data.fetch('for'))
  end
end


