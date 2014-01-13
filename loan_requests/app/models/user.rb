class User < ActiveRecord::Base
  include Concerns::InvisibleModel
  devise :omniauthable, :omniauth_providers => [:centralized_auth]
end
