# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_06_153731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.bigint "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.datetime "created_at", precision: nil
    t.string "scope"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "image_translations", id: :serial, force: :cascade do |t|
    t.bigint "image_id"
    t.string "locale", limit: 255
    t.text "credits"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["image_id"], name: "index_image_translations_on_image_id"
    t.index ["locale"], name: "index_image_translations_on_locale"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "image", limit: 255
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "video", limit: 255
    t.bigint "work_id", null: false
    t.index ["work_id"], name: "index_images_on_work_id"
  end

  create_table "page_translations", id: :serial, force: :cascade do |t|
    t.bigint "page_id"
    t.string "locale", limit: 255
    t.string "title", limit: 255
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_page_translations_on_locale"
    t.index ["page_id"], name: "index_page_translations_on_page_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "section_translations", id: :serial, force: :cascade do |t|
    t.bigint "section_id"
    t.string "locale", limit: 255
    t.string "title", limit: 255
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_section_translations_on_locale"
    t.index ["section_id"], name: "index_section_translations_on_section_id"
  end

  create_table "sections", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "work_id", null: false
    t.index ["work_id"], name: "index_sections_on_work_id"
  end

  create_table "tag_translations", id: :serial, force: :cascade do |t|
    t.bigint "tag_id"
    t.string "locale", limit: 255
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_tag_translations_on_locale"
    t.index ["tag_id"], name: "index_tag_translations_on_tag_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "work_id", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["work_id"], name: "index_taggings_on_work_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "slug_en", limit: 255
    t.string "slug_es", limit: 255
    t.string "slug_ca", limit: 255
    t.integer "taggings_count", default: 0
    t.index ["slug_ca"], name: "index_tags_on_slug_ca"
    t.index ["slug_en"], name: "index_tags_on_slug_en"
    t.index ["slug_es"], name: "index_tags_on_slug_es"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.boolean "admin", default: false
    t.string "password_digest", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "work_translations", id: :serial, force: :cascade do |t|
    t.bigint "work_id"
    t.string "locale", limit: 255
    t.string "title", limit: 255
    t.text "description"
    t.string "techniques", limit: 255
    t.string "place", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["locale"], name: "index_work_translations_on_locale"
    t.index ["work_id"], name: "index_work_translations_on_work_id"
  end

  create_table "works", id: :serial, force: :cascade do |t|
    t.string "slug_en", limit: 255
    t.string "slug_es", limit: 255
    t.string "slug_ca", limit: 255
    t.date "realization_date"
    t.string "dimensions", limit: 255
    t.integer "position"
    t.string "type", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "published", default: false
    t.integer "images_count", default: 0
    t.index ["slug_ca"], name: "index_works_on_slug_ca", unique: true
    t.index ["slug_en"], name: "index_works_on_slug_en", unique: true
    t.index ["slug_es"], name: "index_works_on_slug_es", unique: true
  end

  add_foreign_key "images", "works", on_delete: :cascade
  add_foreign_key "sections", "works", on_delete: :cascade
  add_foreign_key "taggings", "tags", on_delete: :cascade
  add_foreign_key "taggings", "works", on_delete: :cascade
end
