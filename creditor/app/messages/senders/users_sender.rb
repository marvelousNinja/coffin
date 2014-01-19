class UsersSender
  include MqConnector::Sender

  def self.create_for_agreement(email, agreement_id)
    message = {
      :email => email,
      :for => {
        :who => 'agreement',
        :id => agreement_id
      }
    }
    transmit :create_for, :to => :users, :with => message
  end
end