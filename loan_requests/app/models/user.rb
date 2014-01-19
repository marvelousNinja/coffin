class User < ActiveRecord::Base
  include Concerns::User::Devise
  include Concerns::InvisibleModel
end
