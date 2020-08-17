class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :price
      t.text :address
      t.user :reference

      t.timestamps
    end
  end
end
