class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.text :quater
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
Rails g scaffold nearByPlace name distance:decimal user:references house:references