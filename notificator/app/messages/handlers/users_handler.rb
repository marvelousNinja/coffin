class UsersHandler
  include MqConnector::Handler

  def self.handle
    channel  = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    queue = channel.queue('notificator', durable: true).bind(exchange, routing_key: 'user.created')

    queue.subscribe do |metadata, payload|
      user_data = parse_message(payload)
      notify_user(user_data)
      log_message
    end
  end

  private

  def self.parse_message(body)
    JSON.load(body)
  end

  def self.log_message
    puts "Received user.created"
  end

  def self.notify_user(data)
    account_sid = 'AC9a2ebc1510d91b00dd7a22b6ba1547d3'
    auth_token = '36e5040fb7b727316f9b727803969d0e'

    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.messages.create({
      :from => '+16122609669',
      :to => data['phone'],
      :body => "You have been registered, login: #{data['login']}, password: #{data['password']}"
    })
  end
end