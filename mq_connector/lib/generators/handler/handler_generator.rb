class HandlerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc 'Creates a basic template for MqConnector Handler'

  def copy_sender
  	template 'handler.rb', "app/messages/handlers/#{file_name}_handler.rb"
  end
end