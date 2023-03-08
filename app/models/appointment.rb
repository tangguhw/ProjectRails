class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :schedule
  has_one :medical_history
  
  validates :appointment_date, presence: true
  # validates :start, presence: true
  # validates :end, presence: true
  
  def new_attributes
    {
      id: self.id,
      appointment_date: self.appointment_date,
      doctor_id: self.doctor_id,
      patient_id: self.patient_id,
      schedule_id: self.schedule_id,
      # start: self.start,
      # end: self.end,
      created_at: self.created_at,
    }
  end
end
