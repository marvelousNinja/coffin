module Concerns::LoanRequest::SendsMessages
  extend ActiveSupport::Concern

  included do
    after_create :send_message

    def send_message
      LoanRequestsSender.request_created(self)
    end
  end
end