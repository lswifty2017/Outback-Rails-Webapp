class BookingMailer < ApplicationMailer
  def new_booking_email
    @user = params[:user]
    mail(to: @user.email, subject: 'You have made a new booking!')
  end


  def cancelled_booking_email
    @user = params[:user]
    @host = params[:host]
    @booking = params[:booking]
    mail(to: @host.email, subject: "Camper #{@user} has cancelled their stay at #{@booking}")
  end
end 