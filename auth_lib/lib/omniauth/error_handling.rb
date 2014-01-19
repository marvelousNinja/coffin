module OmniAuth
  module ErrorHandling
    extend ActiveSupport::Concern

    included do
      rescue_from ::OAuth2::Error do
        sign_out_and_redirect current_user
      end

      rescue_from ::CanCan::AccessDenied do
        render :file => "#{AuthLib::Engine.root}/public/401_#{I18n.locale}", :status => :unauthorized, :layout => false
      end
    end
  end
end