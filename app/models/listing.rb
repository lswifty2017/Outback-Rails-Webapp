class Listing < ApplicationRecord
  has_many_attached :uploaded_images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users,  through: :bookings
  def all_start_times
    @all_start_times = []
    @bookings = self.bookings
    @all_start_times = @bookings.map do |booking|
      booking.start_date
    end
  end

  def start_date
    @bookings
  end

end
