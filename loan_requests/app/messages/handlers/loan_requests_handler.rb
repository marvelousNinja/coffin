class LoanRequestsHandler
  include MqConnector::Handler

  listen_to :loan_requests, :as => :loan_requests

  on :created do |request_data|
    ApprovalBot.process request_data['id']
  end
end


