class <%= file_name.camelize %>Sender
  include MqConnector::Sender

  def self.going_to_town
    contents = { message: 'I am going to town' }
    send :to => :mom, :key => :going_to_town, :with => contents
  end
end