class Policy < ActiveRecord::Base
  include Concerns::InvisibleModel
  include Concerns::Policy::Relationships
end
