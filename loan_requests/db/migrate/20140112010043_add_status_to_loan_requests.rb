class AddStatusToLoanRequests < ActiveRecord::Migration
  def change
    add_column :loan_requests, :status, :string
  end
end
