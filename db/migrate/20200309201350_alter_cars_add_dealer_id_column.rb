class AlterCarsAddDealerIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :dealer_id, :integer 
    add_index :cars, :dealer_id
  end
end
