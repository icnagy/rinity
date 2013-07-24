class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :trip_id
      t.integer :passenger_id
      t.integer :seat
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
