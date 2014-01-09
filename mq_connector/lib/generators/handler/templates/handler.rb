class <%= file_name.camelize %>Handler
  include MqConnector::Handler

  def self.handle
    ch  = create_channel
    q   = ch.queue("<%= file_name %>", :auto_delete => true)
    x   = ch.default_exchange

    q.subscribe do |metadata, payload|
      puts "Received a message: #{payload}."
    end
  end
end