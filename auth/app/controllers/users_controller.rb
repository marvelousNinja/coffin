class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  doorkeeper_for :all
  before_filter :load_user
  respond_to :json

  def my_permissions
  	@permissions = Ability.new(@user).permission_options
  end

  private

  def load_user
  	@user = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
