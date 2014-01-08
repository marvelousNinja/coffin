require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
 module Strategies
  class CentralizedAuth < OmniAuth::Strategies::OAuth2
    option :name, 'centralized_auth'
    option :client_options, {
      :site => 'http://localhost:3000',
      :authorize_url => '/oauth/authorize',
      :token_url => '/oauth/token'
    }

    uid { raw_info['id'] }

    info do
      {
        email: raw_info['email']
      }
    end

    extra do
      {
        raw_info: raw_info
      }
    end

    def raw_info
      @raw_info ||= access_token.get('/me').parsed
    end
  end
 end
end