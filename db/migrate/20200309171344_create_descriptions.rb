class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :car_id
      t.timestamps
    end
    
    add_index :descriptions, [:user_id, :car_id]
    add_index :descriptions, :car_id
  end
end
