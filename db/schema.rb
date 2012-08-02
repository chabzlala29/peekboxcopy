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

ActiveRecord::Schema.define(:version => 20120801033105) do

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
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.boolean  "featured",    :default => false
  end

  create_table "banners", :force => true do |t|
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners", ["user_id"], :name => "index_banners_on_user_id"

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookmarks", ["user_id"], :name => "index_bookmarks_on_user_id"

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

  create_table "contests", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enable",     :default => true
  end

  create_table "eligibility_codes", :force => true do |t|
    t.string   "code"
    t.boolean  "taken",      :default => false
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eligibility_codes", ["video_id"], :name => "index_eligibility_codes_on_video_id"

  create_table "event_banners", :force => true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "special",     :default => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.text     "message"
    t.string   "message_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "messages", ["friend_id"], :name => "index_messages_on_friend_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "newsletters", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picture_bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "picture_bookmarks", ["picture_id"], :name => "index_picture_bookmarks_on_picture_id"
  add_index "picture_bookmarks", ["user_id"], :name => "index_picture_bookmarks_on_user_id"

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

  create_table "user_messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.string   "type_message"
    t.string   "status"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.boolean  "banned",                                :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "video_ads", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "media"
    t.string   "zencoder_output_id"
    t.string   "thumbnail"
    t.boolean  "processed",          :default => false
  end

  create_table "video_bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_bookmarks", ["user_id"], :name => "index_video_bookmarks_on_user_id"
  add_index "video_bookmarks", ["video_id"], :name => "index_video_bookmarks_on_video_id"

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
    t.integer  "contest_id"
  end

  create_table "wall_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "poster_id"
    t.string   "post"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wall_posts", ["user_id"], :name => "index_wall_posts_on_user_id"

end
