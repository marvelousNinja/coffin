class UserCreatedSender
  include MqConnector::Sender

  def self.send_message(user)
    channel = create_channel
    exchange = channel.topic('events')

    message = build_message(user)
    exchange.publish message, routing_key: 'user.created'

    log_message(user.id)
    channel.close
  end

  private

  def self.build_message(user)
    {
      login: user.email,
      password: user.generated_password,
      email: user.email,
      phone: '+375299983953'
    }.to_json
  end

  def self.log_message(info)
    puts "Sent user.created for User##{info}"
  end
end