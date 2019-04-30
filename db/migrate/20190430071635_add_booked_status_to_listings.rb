class AddBookedStatusToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :booked_status, :boolean
  end
end
