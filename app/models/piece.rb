class Piece < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_one_attached :photo
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
