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

ActiveRecord::Schema.define(:version => 20120702234540) do

  create_table "action_work_translations", :force => true do |t|
    t.integer  "action_work_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.string   "place"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "action_work_translations", ["action_work_id"], :name => "index_action_work_translations_on_action_work_id"
  add_index "action_work_translations", ["locale"], :name => "index_action_work_translations_on_locale"

  create_table "action_works", :force => true do |t|
    t.string   "slug_en"
    t.string   "slug_es"
    t.string   "slug_ca"
    t.date     "realization_date"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "action_works", ["slug_ca"], :name => "index_action_works_on_slug_ca", :unique => true
  add_index "action_works", ["slug_en"], :name => "index_action_works_on_slug_en", :unique => true
  add_index "action_works", ["slug_es"], :name => "index_action_works_on_slug_es", :unique => true

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post_translations", :force => true do |t|
    t.integer  "post_id"
    t.string   "locale"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_translations", ["locale"], :name => "index_post_translations_on_locale"
  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "slug_en"
    t.string   "slug_es"
    t.string   "slug_ca"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["slug_ca"], :name => "index_posts_on_slug_ca", :unique => true
  add_index "posts", ["slug_en"], :name => "index_posts_on_slug_en", :unique => true
  add_index "posts", ["slug_es"], :name => "index_posts_on_slug_es", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",           :default => false
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

  create_table "visual_work_translations", :force => true do |t|
    t.integer  "visual_work_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.string   "techniques"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "visual_work_translations", ["locale"], :name => "index_visual_work_translations_on_locale"
  add_index "visual_work_translations", ["visual_work_id"], :name => "index_visual_work_translations_on_visual_work_id"

  create_table "visual_works", :force => true do |t|
    t.string   "slug_en"
    t.string   "slug_es"
    t.string   "slug_ca"
    t.date     "realization_date"
    t.string   "dimensions"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "visual_works", ["slug_ca"], :name => "index_visual_works_on_slug_ca", :unique => true
  add_index "visual_works", ["slug_en"], :name => "index_visual_works_on_slug_en", :unique => true
  add_index "visual_works", ["slug_es"], :name => "index_visual_works_on_slug_es", :unique => true

  create_table "works", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.date     "realized"
    t.string   "where"
    t.integer  "position"
    t.boolean  "visible"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
