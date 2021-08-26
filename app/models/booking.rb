class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :piece
  has_one :review
  validates :date_start, presence: true
  validates :date_end, presence: true
end
