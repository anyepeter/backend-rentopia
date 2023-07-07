class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.integer :number_of_houses
      t.decimal :price
      t.string :metal_type
      t.string :water_source
      t.boolean :funitures
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :security, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
