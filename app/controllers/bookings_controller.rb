class BookingsController < ApplicationController
  def index
  end

  def create
    @listing = params[:listing]
    @booking = Booking.new({
      user_id: current_user.id,
      listing_id: @listing,
      start_date: params[:start_date],
      end_date: params[:end_date]
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
    @booking  = Booking.find(params[:id])
   @booking.listing.update_attribute(:booked_status, false)
   @user = current_user
   @host_user_id = @booking.listing.user_id
   @host = User.find(@host_user_id)
    BookingMailer.with(host: @host, user: @user, booking: @booking).cancelled_booking_email.deliver_now
    flash[:notice]= "Booking successfully deleted and Host notified"
    @booking.listing.save
    @booking.destroy
    redirect_to listings_path
  end


  private

  def booking_params
    params.permit(:listing, :start_date, :end_date)
  end
end
