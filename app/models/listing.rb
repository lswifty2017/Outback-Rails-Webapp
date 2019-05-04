class Listing < ApplicationRecord
  has_many_attached :uploaded_images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users,  through: :bookings

  def start_date
    @bookings
  end

  def price_filter(price_limit)
    @listing_array = Listing.all
    @listing_array_filtered = []
    @listing_array.each do |listing|
      if listing.price < price_limit
        @listing_array_filtered << listing
      end
    end
    return @listing_array_filtered = []
  end
  
end
