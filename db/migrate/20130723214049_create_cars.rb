class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.integer :seats
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
