class Reservation < ActiveRecord::Base
  belongs_to :trip
  belongs_to :passenger, :class_name => "User", :foreign_key => "passenger_id"
  belongs_to :car
  attr_accessible :trip_id, :is_accepted, :passenger_id, :seat
end
