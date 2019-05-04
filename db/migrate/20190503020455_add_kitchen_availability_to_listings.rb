class AddKitchenAvailabilityToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :kitchen_availability, :boolean
  end
end
