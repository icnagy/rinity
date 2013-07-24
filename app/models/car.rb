class Car < ActiveRecord::Base
  belongs_to :user

  has_many :trips, :foreign_key => "car_id"
  has_many :passengers, :class_name => "User", :foreign_key => "passenger_id", :through => :reservation
  attr_accessible :description, :name, :seats, :trip_id, :user_id
end
