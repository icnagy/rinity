# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130723220624) do

  create_table "cars", :force => true do |t|
    t.string "name"
    t.text "description"
    t.integer "seats"
    t.integer "user_id"
    t.integer "trip_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "push_configurations", :force => true do |t|
    t.string "type", :null => false
    t.string "app", :null => false
    t.text "properties"
    t.boolean "enabled", :default => false, :null => false
    t.integer "connections", :default => 1, :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "push_feedback", :force => true do |t|
    t.string "app", :null => false
    t.string "device", :null => false
    t.string "type", :null => false
    t.string "follow_up", :null => false
    t.datetime "failed_at", :null => false
    t.boolean "processed", :default => false, :null => false
    t.datetime "processed_at"
    t.text "properties"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "push_feedback", ["processed"], :name => "index_push_feedback_on_processed"

  create_table "push_messages", :force => true do |t|
    t.string "app", :null => false
    t.string "device", :null => false
    t.string "type", :null => false
    t.text "properties"
    t.boolean "delivered", :default => false, :null => false
    t.datetime "delivered_at"
    t.boolean "failed", :default => false, :null => false
    t.datetime "failed_at"
    t.integer "error_code"
    t.string "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "push_messages", ["delivered", "failed", "deliver_after"], :name => "index_push_messages_on_delivered_and_failed_and_deliver_after"

  create_table "reservations", :force => true do |t|
    t.integer "trip_id"
    t.integer "passenger_id"
    t.integer "seat"
    t.boolean "is_accepted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trips", :force => true do |t|
    t.string "start_address"
    t.spatial "start", :limit => {:srid => 4326, :type => "point", :geographic => true}
    t.string "destination_address"
    t.spatial "destination", :limit => {:srid => 4326, :type => "point", :geographic => true}
    t.datetime "trip_date"
    t.boolean "is_recurring"
    t.decimal "price"
    t.integer "available_seats"
    t.integer "user_id"
    t.integer "car_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "facebook_id"
    t.string "password"
    t.string "device"
    t.spatial "last_position", :limit => {:srid => 4326, :type => "point", :geographic => true}
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
