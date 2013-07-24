class User < ActiveRecord::Base
  has_many :trips, :class_name => "Trip", :foreign_key => "user_id"
  has_many :cars, :class_name => "Car", :foreign_key => "user_id"
  has_many :reservations, :foreign_key => "passenger_id"
  attr_accessible :email, :facebook_id, :name, :password, :last_position
end
