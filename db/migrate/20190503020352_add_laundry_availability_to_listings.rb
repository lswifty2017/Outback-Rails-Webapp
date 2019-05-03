class AddLaundryAvailabilityToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :laundry_availability, :boolean
  end
end
