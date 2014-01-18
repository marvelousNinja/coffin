class UsersHandler
  include MqConnector::Handler

  listen_to :users

  on :create_for_agreement do |agreement_data|

  end
end


