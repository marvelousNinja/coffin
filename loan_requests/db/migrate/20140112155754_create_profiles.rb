class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :middle_name
      t.string :surname
      t.string :previous_surname
      t.string :gender

      t.date :birthdate
      t.string :origin_country
      t.string :birthplace

      t.string :education
      t.string :marital_status

      t.string :mobile_phone
      t.string :email

      t.integer :loan_request_id

      t.timestamps
    end
  end
end
