class LoanRequestsHandler
  include MqConnector::Handler

  def self.handle
    connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      queue = channel.queue('loan_requests', durable: true).bind(exchange, routing_key: 'loan_request.created')

      queue.subscribe do |metadata, payload|
        loan_request_data = JSON.load(payload)

        loan_request = LoanRequest.find(loan_request_data['id'])
        ApprovalBot.new.process loan_request

        puts "Received a loan_request.created for LoanRequest##{loan_request_data['id']}"
      end
    end
  end
end


