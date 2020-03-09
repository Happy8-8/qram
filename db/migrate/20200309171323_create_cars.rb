class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :ddescription
      t.text :cdescription
      t.string :address
      t.timestamps
    end
  end
end
