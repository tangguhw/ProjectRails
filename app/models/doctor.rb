class Doctor < ApplicationRecord
  has_secure_password
  
  belongs_to :department, dependent: :destroy
  has_many :appointments
  
  has_many :schedules
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  validates :specialization, presence: true, length: { maximum: 50}
  validates :contact, presence: true, length: {  maximum: 16 },
                            format: { with: /\A[0-9]+\z/ },
                            uniqueness: true
  
  def new_attributes
    {
      id: self.id,
      name: self.name,
      email: self.email,
      specialization: self.specialization,
      contact: self.contact,
      department_id: self.department_id,
      created_at: self.created_at,
      
    }
  end
end
