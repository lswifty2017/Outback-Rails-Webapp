class BookingsController < ApplicationController
  def index
  end

  def create
    @start_time = booking_params[:start_time]
    @end_time = booking_params[:end_time]
    @listing_id = booking_params[:listing_id]

    @booking = Booking.new({
      user_id: current_user.id,
      listing_id: @listing_id,
      start_time: @start_time,
      end_time: @end_time
    })

    @listing = Listing.find(@listing_id)
    if @booking.save!
      @user = current_user
      BookingMailer.with(user: @user).new_booking_email.deliver_now
      redirect_to :booking_payment
    else
      redirect_to :root
    end
  end

  def show_user_bookings
    @booking = Booking.all
    @user = current_user
  end

  def booking_payment
    @booking = Booking.last
    @day_cost = @booking.listing.cost
    @total_days = @booking.amount_of_days
    @total_cost = @day_cost * @total_days
    render "booking_payment"
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
    params.permit(:listing_id, :start_time, :end_time)
  end
end
