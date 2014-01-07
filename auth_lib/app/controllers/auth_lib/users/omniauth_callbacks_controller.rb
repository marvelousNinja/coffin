class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def centralized_auth
	  options = request.env['omniauth.auth']
		user = User.find_or_create_by uid: options[:uid], provider: options[:provider]
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		sign_in_and_redirect user, :event => :authentication
	end
end