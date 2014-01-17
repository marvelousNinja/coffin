class LoanRequestsHandler
  include MqConnector::Handler

  def self.handle
    connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      queue = channel.queue('loan_requests', durable: true).bind(exchange, routing_key: 'loan_request.approved')

      queue.subscribe do |metadata, payload|
        loan_request_data = JSON.load(payload)

        LoanAgreement.create!({
          credit_product: CreditProduct.first
        })

        puts "Received a loan_request.approved for LoanRequest##{loan_request_data['id']}"
      end
    end
  end
end


