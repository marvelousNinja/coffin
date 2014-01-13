class Document < ActiveRecord::Base
  include Concerns::InvisibleModel
  belongs_to :loan_request
  # document_type -> passport, or something else?
end
