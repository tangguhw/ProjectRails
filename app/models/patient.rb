class Patient < ApplicationRecord
  has_many :medical_histories
  has_many :appointment

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence:true, length: { maximum: 100 }
  validates :dob, presence:true
  validates :contact, presence: true, length: {  maximum: 16 },
                            format: { with: /\A[0-9]+\z/ },
                            uniqueness: true
  validates :gender, presence: true

  enum gender: {
    male: 1,
    female: 2
  }

  def new_attributes
    {
      id: self.id,
      name: self.name,
      address: self.address,
      dob: self.dob,
      gender: self.gender,
      contact: self.contact,
      created_at: self.created_at,
    }
  end
end
