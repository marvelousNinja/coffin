module Concerns::SendsMessages
  extend ActiveSupport::Concern

  included do
    after_create :send_message

    def send_message
      UserSender.user_created(self)
    end
  end
end