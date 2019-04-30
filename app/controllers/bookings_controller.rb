class BookingsController < ApplicationController
  def index
  end

  def create
    @listing = params[:listing]
    @booking = Booking.new({
      user_id: current_user.id,
      listing_id: @listing,
    })
    @booking.listing.update_attribute(:booked_status, true)
    if @booking.save
      redirect_to listings_path
    else
      redirect_to :root
    end
  end

  def edit
  end

  def destroy
  end

  private

  def booking_params
    params.permit(:listing)
  end
end
