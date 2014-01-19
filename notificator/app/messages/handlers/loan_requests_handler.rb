class LoanRequestsHandler
  include MqConnector::Handler

  listen_to :loan_requests, :as => :notificator

  on :approved do |request|
    account_sid = 'AC9a2ebc1510d91b00dd7a22b6ba1547d3'
    auth_token = '36e5040fb7b727316f9b727803969d0e'
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create({
      :from => '+16122609669',
      :to => '+375299983953',
      :body => "Your loan request have been approved"
    })
  end
end


