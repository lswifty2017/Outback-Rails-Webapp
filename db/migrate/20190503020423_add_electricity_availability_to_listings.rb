class AddElectricityAvailabilityToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :electricity_availability, :boolean
  end
end
