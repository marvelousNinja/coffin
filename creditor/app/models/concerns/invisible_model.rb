module Concerns::InvisibleModel
  extend ActiveSupport::Concern

  included do
    rails_admin { visible false }
  end
end