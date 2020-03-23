class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :car_id
      t.timestamps
    end
    
    add_index :reviews, [:user_id, :car_id]
    add_index :reviews, :car_id
  end
end
