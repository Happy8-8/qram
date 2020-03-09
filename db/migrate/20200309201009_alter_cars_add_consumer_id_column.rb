class AlterCarsAddConsumerIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :consumer_id, :integer 
    add_index :cars, :consumer_id
  end
end
