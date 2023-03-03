class Department < ApplicationRecord
  has_many :doctors
  # , class_name: "id", foreign_key: "doctor_id"
  
  validates :name, presence: true, length: { maximum: 50 }
  def new_attributes
    {
        id: self.id,
        name: self.name,
        created_at: self.created_at
    }
  end
end
