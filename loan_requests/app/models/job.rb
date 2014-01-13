class Job < ActiveRecord::Base
  include Concerns::InvisibleModel
  belongs_to :loan_request
end
