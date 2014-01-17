class UsersSender
  include MqConnector::Sender

  def self.user_created(user)
    self.connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      password = user.generate_password(true)
      user.save

      message = user.attributes
      message['password'] = password

      exchange.publish message.to_json, routing_key: 'user.created', persistent: true

      puts "Sent user.created for User##{user.id}"

      self.disconnect
    end
  end
end