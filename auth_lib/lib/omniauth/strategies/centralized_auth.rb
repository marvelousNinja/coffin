require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
 module Strategies
  class CentralizedAuth < OmniAuth::Strategies::OAuth2
    option :name, 'centralized_auth'
    option :provider_ignores_state, true
    option :client_options, {
      :site => 'http://localhost:3000',
      :authorize_url => '/oauth2/authorize',
      :token_url => '/oauth2/token'
    }

    uid { raw_info['id'] }

    extra do
      {
        'raw_info' => raw_info
      }
    end

    def raw_info
      @raw_info ||= access_token.get("/users/me.json?access_token=#{access_token.token}&client=#{access_token.client.id}").parsed
    end
  end
 end
end