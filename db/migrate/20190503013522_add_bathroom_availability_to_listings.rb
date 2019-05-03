class AddBathroomAvailabilityToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :bathroom_availability, :boolean
  end
end
