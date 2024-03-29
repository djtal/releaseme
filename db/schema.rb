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

ActiveRecord::Schema.define(:version => 20111019193235) do

  create_table "applications", :force => true do |t|
    t.integer  "channel_id"
    t.integer  "environment_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", :force => true do |t|
    t.integer  "version_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "application_id"
  end

  create_table "delivery_flow_envs", :force => true do |t|
    t.integer  "delivery_flow_id"
    t.integer  "environment_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_flows", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "environments", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ask_deliver", :default => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description"
    t.text     "description"
  end

  create_table "versions", :force => true do |t|
    t.string   "version"
    t.integer  "channel_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "require_label"
    t.text     "description"
  end

  create_table "work_items", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
