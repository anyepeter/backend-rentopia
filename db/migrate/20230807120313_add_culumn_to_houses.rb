class AddCulumnToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :bedroom, :integer
    add_column :houses, :bathroom, :integer
    add_column :houses, :kitchen, :integer
    add_column :houses, :description, :text
    rename_column :houses, :funitures, :garage
  end
end
