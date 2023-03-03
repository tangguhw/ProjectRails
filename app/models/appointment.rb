class Appointment < ApplicationRecord
  belongs_to :doctor, dependent: :destroy
  belongs_to :patient, dependent: :destroy
  belongs_to :schedule, dependent: :destroy
  has_many :medical_histories, dependent: :destroy
  
  validates :appointment_date, presence: true
  validates :start, presence: true
  validates :end, presence: true
  
  def new_attributes
    {
      id: self.id,
      start: self.start,
      end: self.end,
      created_at: self.created_at,
    }
  end
end
