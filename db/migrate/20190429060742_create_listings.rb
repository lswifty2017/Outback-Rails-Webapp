class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :location
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end
