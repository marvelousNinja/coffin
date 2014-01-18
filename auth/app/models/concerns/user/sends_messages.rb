module Concerns::User::SendsMessages
  extend ActiveSupport::Concern

  included do
    after_create :send_message

    def send_message
      UsersSender.created(self)
    end
  end
end