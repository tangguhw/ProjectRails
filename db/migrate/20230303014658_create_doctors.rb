class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :specialization
      t.string :contact
      t.integer :department_id
      t.string :password_digest
      t.timestamps
    end
  end
end
