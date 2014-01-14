class LoanRequestsSender
  include MqConnector::Sender

  def self.request_created(request)
    channel = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    exchange.publish request.attributes.to_json, routing_key: 'loan_request.created', persistent: true

    puts "Loan request has been created for #{request}"

    channel.close
  end

  def self.request_approved(request)
    channel = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    exchange.publish request.attributes.to_json, routing_key: 'loan_request.approved', persistent: true

    puts "Loan request has been approved for #{request}"

    channel.close
  end

  def self.request_rejected(request)
    channel = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    exchange.publish request.attributes.to_json, routing_key: 'loan_request.rejected', persistent: true

    puts "Loan request has been rejected for #{request}"

    channel.close
  end
end