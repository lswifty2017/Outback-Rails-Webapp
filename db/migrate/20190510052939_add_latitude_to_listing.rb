class AddLatitudeToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :latitude, :float
  end
end
