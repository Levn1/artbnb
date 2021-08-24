class Piece < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_one_attached :photo
end
