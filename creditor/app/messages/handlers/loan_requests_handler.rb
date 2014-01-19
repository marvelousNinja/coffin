class LoanRequestsHandler
  include MqConnector::Handler

  listen_to :loan_requests, :as => :creditor

  on :approved do |request|
    agreement = LoanAgreement.create!({
      credit_product: CreditProduct.first
    })

   UsersSender.create_for_agreement(request['email'], agreement.id)
  end
end


