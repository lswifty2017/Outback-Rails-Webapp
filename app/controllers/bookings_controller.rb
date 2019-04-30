class BookingsController < ApplicationController
  def index
  end

  def create
    @listing = params[:listing]
    @booking = Booking.new({
      user_id: current_user.id,
      listing_id: @listing
    })
    @booking.save
    redirect_to root_path
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
