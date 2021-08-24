class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :piece
  has_one :review
end
