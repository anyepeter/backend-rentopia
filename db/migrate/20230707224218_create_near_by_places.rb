class CreateNearByPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :near_by_places do |t|
      t.string :name
      t.decimal :distance
      t.references :user, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
