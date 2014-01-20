class LoanRequestsSender
  include MqConnector::Sender

  class << self
    def created(request)
      transmit :created, :to => :loan_requests, :with => JSON.load(request.to_json(:include => [:profile, :job, :document])
    end

    def approved(request)
      transmit :approved, :to => :loan_requests, :with => JSON.load(request.to_json(:include => [:profile, :job, :document])
    end

    def rejected(request)
      transmit :rejected, :to => :loan_requests, :with => JSON.load(request.to_json(:include => [:profile, :job, :document])
    end
  end
end