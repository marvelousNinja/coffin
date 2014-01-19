class UsersSender
  include MqConnector::Sender

  def self.created(user)
    message = user.attributes
    message['password'] = user.password

    transmit :created, :to => :users, :with => message
  end

  def self.created_for(user, receiver)
    message = user.attributes
    message['for'] = receiver

    transmit :created_for, :to => :users, :with => message
  end
end