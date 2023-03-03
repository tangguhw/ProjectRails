class CreateMedicalHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_histories do |t|
      t.text :complaint
      t.text :diagnosis
      t.text :prescription
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
