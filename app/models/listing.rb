class Listing < ApplicationRecord
  has_many_attached :uploaded_images
  has_many :bookings
  has_many :users,  through: :bookings
end
