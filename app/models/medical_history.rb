class MedicalHistory < ApplicationRecord
  has_many :patients

  validates :complaint, presence: true, length: { maximum: 200 }
  validates :diagnosis, presence: true, length: { maximum: 200 }
  validates :prescription, presence: true, length: { maximum: 200 }
  
  def new_attributes
    {
      id: self.id,
      complaint: self.complaint,
      diagnosis: self.diagnosis,
      prescription: self.prescription
    }
  end
end
