class LoanRequestsHandler
  include MqConnector::Handler

  listen_to :loan_requests, :as => :creditor_handler_for_loan_requests

  on :approved do |request|
    agreement = LoanAgreement.create!({
      credit_product: CreditProduct.first,
      loan_request_id: request['id']
    })

   UsersSender.create_for_agreement(request['profile']['email'], agreement.id)
  end
end


