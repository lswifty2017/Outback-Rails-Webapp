class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :date_booked
      t.references :user
      t.references :listing
      t.timestamps
    end
  end
end
