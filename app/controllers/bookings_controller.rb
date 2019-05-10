class BookingsController < ApplicationController
  load_and_authorize_resource
  def index
  end

  def create
    @start_time = booking_params[:start_time]
    @end_time = booking_params[:end_time]
    @listing_id = booking_params[:listing_id]
    @guests = booking_params[:guests]

    @booking = Booking.new({
      user_id: current_user.id,
      listing_id: @listing_id,
      start_time: @start_time,
      end_time: @end_time,
      guests: @guests
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

  def create_check 
    @start_time = booking_params[:start_time].to_date
    @end_time = booking_params[:end_time].to_date
    @listing_id = booking_params[:listing_id]
    @listing = Listing.find(@listing_id)

    if @listing.bookings.empty? == true
      @available = true
    else
      @listing.bookings.each do |booking|
      @bookings_array = (booking.start_time.to_date..booking.end_time.to_date).to_a
        if @bookings_array.find {|date|date === @start_time || date === @end_time} !=nil
          @available = false
          break
        end
      end
      
    end
    
    if @available == false
      flash[:notice]= "The dates requested are currently unavailable."
      redirect_back(fallback_location: root_path)
    else
      redirect_to create_booking_path(booking_params)
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
    @guests = @booking.guests
    render "booking_payment"
  end

  def edit
  end

  def destroy
   @booking  = Booking.find(params[:id])
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
    params.permit(:listing_id, :start_time, :end_time, :guests)
  end
end
