class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.timestamp :start
      t.timestamp :end
      t.integer :schedule_id
      t.integer :doctor_id
      t.integer :patient_id
      t.timestamps
    end
  end
end
