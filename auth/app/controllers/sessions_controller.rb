class SessionsController < Devise::SessionsController
  def create
    if params[:anonymous]
      sign_in_and_redirect User.anonymous, :event => :authentication
    else
      super
    end
  end
end
