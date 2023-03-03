class Doctor < ApplicationRecord
#   has_secure_password
  
  belongs_to :department, dependent: :destroy
  has_many :appointments
  # , class_name: "id", foreign_key: "appointment_id"
  has_many :schedules
  # , class_name: "id", foreign_key: "schedule_id"

  validates :name, presence: true, length: { maximum: 50 }
  validates :specialization, presence: true, length: { maximum: 50}
  validates :contact, presence: true, length: {  maximum: 16 },
                            format: { with: /\A[0-9]+\z/ },
                            uniqueness: true
  
  def new_attributes
    {
      id: self.id,
      name: self.name,
      specialization: self.specialization,
      contact: self.contact,
      created_at: self.created_at,
      
    }
  end
end
