class Fine < ActiveRecord::Base
  belongs_to :loan_agreement, :inverse_of => :fine
end
