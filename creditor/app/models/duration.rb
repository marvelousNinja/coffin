class Duration < ActiveRecord::Base
  belongs_to :loan_agreement, :inverse_of => :duration
end
