class User < ActiveRecord::Base
  has_many :trips, :class_name => "Trip", :foreign_key => "user_id"
  has_many :cars, :class_name => "Car", :foreign_key => "user_id"
  has_many :reservations, :foreign_key => "passenger_id"
  attr_accessible :email, :facebook_id, :name, :password, :last_position, :device

  validates_presence_of :name, :email, :password
  validates :email, :uniqueness => true

  def notify
    puts "Sending notification"
    unless self.device.nil?
      puts "  to device #{self.device}"
      Push::MessageGcm.create(app: 'Rinity', device: self.device, payload: {message: 'Hello World'}, collapse_key: 'MSG')
    end
    # TODO: send email
  end

end
