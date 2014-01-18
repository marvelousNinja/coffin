class UsersSender
  include MqConnector::Sender

  def self.created(user)
    message = user.attributes
    message['password'] = user.password

    transmit :created, :to => :users, :with => message
  end

  def self.created_for_agreement(user, id)
    message = user.attributes
    message['agreement_id'] = id

    transmit :created_for_agreement, :to => :users, :with => message
  end
end