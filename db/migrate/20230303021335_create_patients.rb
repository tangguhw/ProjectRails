class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.date :dob
      t.string :contact
      t.integer :gender
      t.integer :medical_history_id
      t.timestamps
    end
  end
end
