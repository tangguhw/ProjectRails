class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :day
      t.timestamp :start
      t.timestamp :end
      t.integer :doctor_id
      t.timestamps
    end
  end
end
