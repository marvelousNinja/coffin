class Profile < ActiveRecord::Base
  belongs_to :loan_request
end
