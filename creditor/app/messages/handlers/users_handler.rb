class UsersHandler
  include MqConnector::Handler

  listen_to :users, :as => :creditor_handler_for_users

  on :created_for do |user|
    agreement_data = user.fetch('for')
    if agreement_data.fetch('who') == 'agreement'
      agreement = LoanAgreement.find(agreement_data.fetch('id'))
      agreement.update_attributes(:user_id => user.fetch('id'))
    end
  end
end


