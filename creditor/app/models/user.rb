class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:centralized_auth]
end
