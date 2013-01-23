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

ActiveRecord::Schema.define(:version => 20130123053245) do

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "system_admin",    :default => false
    t.string   "password_digest"
    t.integer  "employee_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "item_no"
    t.string   "source_from"
    t.string   "vendor_brand"
    t.string   "model_no"
    t.string   "description"
    t.decimal  "fob"
    t.string   "fob_port"
    t.string   "payment_terms"
    t.integer  "moq"
    t.integer  "repeat_order_leadtime"
    t.string   "packaging"
    t.decimal  "suggested_retail"
    t.boolean  "tooling_complete"
    t.text     "remarks"
    t.integer  "project_id"
    t.string   "vendor"
    t.string   "vendor_email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.integer  "employee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
