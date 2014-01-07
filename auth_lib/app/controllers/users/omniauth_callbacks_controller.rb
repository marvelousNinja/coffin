class Users::OmniauthCallbacksController < ::Devise::OmniauthCallbacksController
	skip_before_filter:verify_authenticity_token

	def new_session_path(params)
		new_user_session_path
	end
	def centralized_auth
		binding.pry
	  options = request.env['omniauth.auth']
		user = User.find_or_create_by uid: options[:uid], provider: options[:provider]
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		sign_in_and_redirect user, :event => :authentication
	end
end