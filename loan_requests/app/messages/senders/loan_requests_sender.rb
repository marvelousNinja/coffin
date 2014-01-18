class LoanRequestsSender
  include MqConnector::Sender

  class << self
    def created(request)
      transmit :created, :to => :loan_requests, :with => request.attributes
    end

    def approved(request)
      transmit :approved, :to => :loan_requests, :with => request.attributes
    end

    def rejected(request)
      transmit :rejected, :to => :loan_requests, :with => request.attributes
    end
  end
end