class SenderGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc 'Creates a basic template for MqConnector Sender'

  def copy_sender
  	template 'sender.rb', "app/messages/senders/#{file_name}_sender.rb"
  end
end