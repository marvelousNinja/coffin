class LoanRequestsSender
  include MqConnector::Sender

  def self.request_created(request)
    connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      exchange.publish request.attributes.to_json, routing_key: 'loan_request.created', persistent: true

      puts "Loan request has been created for #{request}"

      disconnect
    end
  end

  def self.request_approved(request)
    connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      exchange.publish request.attributes.to_json, routing_key: 'loan_request.approved', persistent: true

      puts "Loan request has been approved for #{request}"

      disconnect
    end
  end

  def self.request_rejected(request)
    connect do |connection, channel|
      exchange = channel.topic('events', durable: true)

      exchange.publish request.attributes.to_json, routing_key: 'loan_request.rejected', persistent: true

      puts "Loan request has been rejected for #{request}"

      disconnect
    end
  end
end