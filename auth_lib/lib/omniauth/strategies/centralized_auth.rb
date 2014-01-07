require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
 module Strategies
  class CentralizedAuth < OmniAuth::Strategies::OAuth2
    option :name, 'centralized_auth'
    option :client_options, {
      :site => 'http://localhost:3000',
      :authorize_url => '/oauth2/authorize',
      :token_url => '/oauth2/token'
    }

    uid { raw_info['id'] }

    info do
      {
        email: raw_info['email']
      }
    end
  end
 end
end