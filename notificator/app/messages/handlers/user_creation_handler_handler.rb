class UserCreationHandler
  include MqConnector::Handler

  def self.handle
    channel  = create_channel auto_recovery: true
    channel.queue('notificator', :durable => true, :auto_delete => true).bind('events', routing_key: 'user.created').subscribe do |metadata, payload|
      user_data = parse_message(payload)

      puts user_data

      log_message
    end
  end

  private

  def parse_message(body)
    JSON.load(body)
  end

  def log_message
    puts "Received user.created"
  end
end