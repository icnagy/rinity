class Trip < ActiveRecord::Base
  set_rgeo_factory_for_column(:start, RGeo::Geographic.spherical_factory(:srid => 4326))
  set_rgeo_factory_for_column(:destination, RGeo::Geographic.spherical_factory(:srid => 4326))

  belongs_to :user
  belongs_to :car
  has_many :reservations
  has_many :passengers, :class_name => "User", :foreign_key => "passenger_id", :through => :reservations, :conditions => "reservations.is_accepted = true"

  attr_accessible :destination, :destination_address, :is_recurring, :available_seats, :price, :start, :start_address, :trip_date, :user_id
end
