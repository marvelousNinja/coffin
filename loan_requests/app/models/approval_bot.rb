class ApprovalBot
  def self.process(id)
    tries = 3
    begin
      PaperTrail.whodunnit = User.find_by email: 'approval@bot.com'
      loan_request = LoanRequest.find id
      if loan_request.sum < 750_000
        loan_request.approve!
      else
        loan_request.wait_for_security_check!
      end
    rescue ActiveRecord::RecordNotFound
      if (tries -= 1) >= 0
        sleep 2
        retry
      else
        puts "[#{self}] Can't find loan requests with specified ID"
      end
    end
  end
end
