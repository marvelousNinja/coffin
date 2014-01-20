class AccountsSender
  include MqConnector::Sender

  def self.created_for(message)
    transmit :created_for, :to => :accounts, :with => message
  end
end