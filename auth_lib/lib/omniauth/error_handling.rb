module OmniAuth
  module ErrorHandling
    extend ActiveSupport::Concern

    included do
      rescue_from ::OAuth2::Error do
        sign_out_and_redirect current_user
      end
    end
  end
end