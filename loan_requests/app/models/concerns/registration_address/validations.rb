module Concerns::RegistrationAddress::Validations
  extend ActiveSupport::Concern

  included do
    validates :registered_at, :presence => true, :date => {
      after: Proc.new { Date.new(2007) },
      before: Proc.new { Time.now }
    }
  end
end