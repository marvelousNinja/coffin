class AccountsHandler
  include MqConnector::Handler

  listen_to :accounts, :as => :creditor_handler_for_accounts

  on :created_for do |message_contents|
    recipient = message_contents['for']
    if recipient['who'] == 'agreement'
      agreement = LoanAgreement.find(recipient.fetch('id'))
      agreement.account_id = message_contents.fetch('id')
    end
    agreement.activate!
  end
end


