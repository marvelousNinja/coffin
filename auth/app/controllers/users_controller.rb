class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  doorkeeper_for :all
  respond_to :json

  def me
    @user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
