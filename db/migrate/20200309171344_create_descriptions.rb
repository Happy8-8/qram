class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.text :message
      t.string :rating
      t.integer :dealer_id
      t.integer :car_id
      t.timestamps
    end
    
    add_index :descriptions, [:dealer_id, :car_id]
    add_index :descriptions, :car_id
  end
end
