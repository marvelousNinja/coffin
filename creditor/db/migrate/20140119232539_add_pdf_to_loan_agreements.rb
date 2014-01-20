class AddPdfToLoanAgreements < ActiveRecord::Migration
  def change
    add_column :loan_agreements, :pdf, :string
  end
end
