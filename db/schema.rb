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

ActiveRecord::Schema.define(:version => 20120412193505) do

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner"
    t.string   "location"
  end

  create_table "ads_states", :force => true do |t|
    t.boolean  "active"
    t.integer  "ads_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads_states", ["ads_id"], :name => "index_ads_states_on_ads_id"

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.boolean  "featured",   :default => false
  end

  create_table "banners", :force => true do |t|
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners", ["user_id"], :name => "index_banners_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "video_id"
    t.integer  "user_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.boolean  "featured",    :default => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "album_id"
    t.string   "image"
  end

  create_table "thumbnails", :force => true do |t|
    t.string   "url"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thumbnails", ["video_id"], :name => "index_thumbnails_on_video_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.text     "location"
    t.string   "occupation"
    t.string   "website"
    t.boolean  "admin",                                 :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "sex"
    t.string   "profilepic"
    t.string   "shoutout"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "media"
    t.string   "zencoder_output_id"
    t.boolean  "processed"
    t.boolean  "featured",           :default => false
  end

end
