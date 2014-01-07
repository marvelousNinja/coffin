class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def me
  	client = Devise::Oauth2Providable::Client.find_by(identifier: params[:client])
  	if client && access_token = client.access_tokens.find_by(token: params[:access_token])
  	  user = access_token.user
      render :json => user.to_json
    else
    	binding.pry
    	raise 'bullshit'
    end
  end
end
