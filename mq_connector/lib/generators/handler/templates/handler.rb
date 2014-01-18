class <%= file_name.camelize %>Handler
  include MqConnector::Handler

  listen_to :<%= file_name.underscore %>

  on :some_message_key do |message_contents|
    ## Your processing code here
  end
end


