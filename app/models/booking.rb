class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :piece
  has_one :review
  validates :date_start, presence: true
  validates :date_end, presence: true
  after_initialize :default_status

  def default_status
    self.status = "Pending"
  end
end
