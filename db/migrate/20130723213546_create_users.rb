class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :facebook_id
      t.string :password
      t.point :last_position, :geographic => true

      t.timestamps
    end
  end
end
