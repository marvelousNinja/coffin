class Document < ActiveRecord::Base
  belongs_to :loan_request
  # document_type -> passport, or something else?
end
