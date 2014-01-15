class UsersSender
  include MqConnector::Sender

  def self.user_created(user)
    self.connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      exchange.publish user.attributes.to_json, routing_key: 'user.created', persistent: true

      puts "Sent user.created for User##{user.id}"

      self.disconnect
    end
  end
end