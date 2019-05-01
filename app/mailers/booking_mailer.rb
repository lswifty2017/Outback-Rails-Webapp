class BookingMailer < ApplicationMailer
  def new_booking_email
    @user = params[:user]
    mail(to: @user.email, subject: 'You have made a new booking!')
  end
end
