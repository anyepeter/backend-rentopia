class CreateSecurities < ActiveRecord::Migration[7.0]
  def change
    create_table :securities do |t|
      t.boolean :gate
      t.boolean :securityMan

      t.timestamps
    end
  end
end
