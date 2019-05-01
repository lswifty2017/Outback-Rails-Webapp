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
      @user = current_user
      BookingMailer.with(user: @user).new_booking_email.deliver_now
      redirect_to listings_path
    else
      redirect_to :root
    end
  end

  def show_user_bookings
    @booking = Booking.all
    @user = current_user
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
