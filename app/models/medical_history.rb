class MedicalHistory < ApplicationRecord
  belongs_to :patient
  has_one :appointment

  validates :complaint, presence: true, length: { maximum: 200 }
  validates :diagnosis, presence: true, length: { maximum: 200 }
  validates :prescription, presence: true, length: { maximum: 200 }
  
  def new_attributes
    {
      id: self.id,
      complaint: self.complaint,
      diagnosis: self.diagnosis,
      prescription: self.prescription,
      doctor_id: self.doctor_id,
      patient_id: self.patient_id
    }
  end
end
