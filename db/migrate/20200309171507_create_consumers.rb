class CreateConsumers < ActiveRecord::Migration[5.2]
  def change
    create_table :consumers do |t|

      t.timestamps
    end
  end
end
