class User < ActiveRecord::Base
  include Concerns::InvisibleModel
  include Concerns::User::Relationships
  devise :omniauthable, :omniauth_providers => [:centralized_auth]
end
