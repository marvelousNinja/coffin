class Payment < ActiveRecord::Base
  include Concerns::Payment::RailsAdmin
  
  belongs_to :loan_agreement, :inverse_of => :payments

  before_save do
    self.sum = basic_part.to_i + percent_part.to_i
  end
end
