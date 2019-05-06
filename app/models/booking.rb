class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  def amount_of_days
    @start_time = self.start_time.to_date
    @end_time = self.end_time.to_date
    @total_days = @end_time - @start_time
    @total_days = @total_days.to_i
  end

  
end
