class Schedule < ApplicationRecord
  belongs_to :doctor, dependent: :destroy
  belongs_to :appointment, dependent: :destroy
  
  validates :day, presence:true
  validates :start, presence: true
  validates :end, presence: true
  
  def new_attributes
    {
      id: self.id,
      day: self.day,
      start: self.start,
      end: self.end,
      created_at: self.created_at,
    }
  end
end
