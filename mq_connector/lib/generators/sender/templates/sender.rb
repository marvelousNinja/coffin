class <%= file_name.capitalize %>Sender
  include MqConnector::Sender

  def self.send_message(message)
    ch  = create_channel
    q   = ch.queue("<%= file_name %>", :auto_delete => true)
    x   = ch.default_exchange

    x.publish message, :routing_key => q.name
  end
end