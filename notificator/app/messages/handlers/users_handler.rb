class UsersHandler
  include MqConnector::Handler

  def self.handle
    self.connect do |connection ,channel|
      exchange = channel.topic('events', durable: true)

      channel.prefetch(1)

      queue = channel.queue('notificator', durable: true).bind(exchange, routing_key: 'user.created')

      queue.subscribe do |metadata, payload|
        user_data = parse_message(payload)
        notify_user(user_data)
        puts "Received user.created for User##{user_data['id']}"
      end
    end
  end

  private

  def self.parse_message(body)
    JSON.load(body)
  end

  def self.notify_user(data)
    account_sid = 'AC9a2ebc1510d91b00dd7a22b6ba1547d3'
    auth_token = '36e5040fb7b727316f9b727803969d0e'

    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.messages.create({
      :from => '+16122609669',
      :to => '+375299983953',
      :body => "You have been registered, login: #{data['email']}, password: #{data['password']}"
    })
  end
end