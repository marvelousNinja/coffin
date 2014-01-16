class Percent < ActiveRecord::Base
  belongs_to :loan_agreement, :inverse_of => :percent
end
