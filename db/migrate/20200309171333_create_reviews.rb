class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :message
      t.string :rating
      t.integer :consumer_id
      t.integer :car_id
      t.timestamps
    end
    
    add_index :reviews, [:consumer_id, :car_id]
    add_index :reviews, :car_id
  end
end
