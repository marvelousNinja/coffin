class LoanRequestsHandler
  include MqConnector::Handler

  def self.handle
    channel  = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    queue = channel.queue('loan_requests', durable: true).bind(exchange, routing_key: 'loan_request.created')

    queue.subscribe do |metadata, payload|
      message = JSON.load(payload)

      loan_request = LoanRequest.find(message['id'])
      ApprovalBot.new.process loan_request

      puts "Received a message: #{payload}"
    end
  end
end


