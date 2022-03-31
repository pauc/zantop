class DropCkeditorAssets < ActiveRecord::Migration[7.0]
  def change
    drop_table :ckeditor_assets, id: :serial do |t|
      t.string "data_file_name", limit: 255, null: false
      t.string "data_content_type", limit: 255
      t.integer "data_file_size"
      t.bigint "assetable_id"
      t.string "assetable_type", limit: 30
      t.string "type", limit: 30
      t.integer "width"
      t.integer "height"
      t.datetime "created_at", precision: nil, null: false
      t.datetime "updated_at", precision: nil, null: false
      t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
      t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
    end
  end
end
