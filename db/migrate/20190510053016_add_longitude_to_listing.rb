class AddLongitudeToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :longitude, :float
  end
end
