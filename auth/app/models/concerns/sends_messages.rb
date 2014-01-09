module Concerns::SendsMessages
  extend ActiveSupport::Concern

  included do
    after_create :send_message

    def send_message
      UserCreatedSender.send_message(self)
    end
  end
end