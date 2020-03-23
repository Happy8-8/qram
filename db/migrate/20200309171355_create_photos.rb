class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :caption
      t.integer :user_id
      t.integer :car_id
      t.timestamps
    end
    add_index :photos, [:user_id, :car_id]
    add_index :photos, :car_id
  end
end
