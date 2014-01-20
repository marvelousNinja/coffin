class AccountsHandler
  include MqConnector::Handler

  listen_to :accounts, :as => :accounts_handler_for_accounts

  on :create_for do |message_contents|
    primary_account = Account.create!({
      :user_id => message_contents['user_id'],
      :secondary_account => Account.create!({
        :user_id => message_contents['user_id']
      })
    })

    ## Reconsider this

    message = {
      'for' => message_contents.fetch('for'),
      'id' => primary_account.id
    }

    AccountsSender.created_for(message)
  end

  on :write_off do |message_contents|
    Account.find(message_contents.fetch['id']).write_off(message_contents['amount'].to_i)
  end
end


