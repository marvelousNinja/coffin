class Users::OmniauthCallbacksController < ::Devise::OmniauthCallbacksController
	skip_before_filter:verify_authenticity_token

	def new_session_path(params)
		new_user_session_path
	end

	def centralized_auth
	  options = request.env['omniauth.auth']
		user = User.find_or_initialize_by uid: options.uid, provider: options.provider, email: options.info.email
		user.access_token = options.credentials.token
		user.save

    set_flash_message(:notice, :success, :kind => "Centralized auth") if is_navigational_format?
		sign_in_and_redirect user, :event => :authentication
	end
end