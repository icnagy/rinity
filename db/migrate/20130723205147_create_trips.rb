class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :start_address
      t.point :start, :geographic => true
      t.string :destination_address
      t.point :destination, :geographic => true
      t.datetime :trip_date
      t.boolean :is_recurring
      t.decimal :price
      t.integer :available_seats
      t.integer :user_id
      t.integer :car_id

      t.timestamps
    end
  end
end
