class AccountsSender
  include MqConnector::Sender

  def self.create_for(agreement)
    message = {
      :user_id => agreement.user_id,
      :for => {
        :who => 'agreement',
        :id => agreement.id
      }
    }
    transmit :create_for, :to => :accounts, :with => message
  end
end