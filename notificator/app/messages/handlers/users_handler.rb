class UsersHandler
  include MqConnector::Handler

  listen_to :users, :as => :notificator_handler_for_users

  on :created do |user_data|
    account_sid = 'AC9a2ebc1510d91b00dd7a22b6ba1547d3'
    auth_token = '36e5040fb7b727316f9b727803969d0e'
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create({
      :from => '+16122609669',
      :to => '+375299983953',
      :body => "You have been registered, login: #{user_data['email']}, password: #{user_data['password']}"
    })
  end
end