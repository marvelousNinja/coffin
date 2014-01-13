class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document_type
      t.string :series
      t.string :number
      t.string :personal_number
      t.string :issued_by
      t.date :issued_at
      t.date :expires_at
      t.string :latin_name
      t.string :latin_surname

      t.integer :loan_request_id

      t.timestamps
    end
  end
end
