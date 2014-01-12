class ApprovalBot
  def process(loan_request)
    PaperTrail.whodunnit = User.find_by email: 'approval@bot.com'
    if loan_request.sum < 1500
      loan_request.approve!
    else
      loan_request.wait_for_security_check!
    end
  end
end
