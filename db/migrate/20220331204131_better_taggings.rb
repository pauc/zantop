class BetterTaggings < ActiveRecord::Migration[7.0]
  def change
    change_table :taggings, bulk: true do |t|
      t.bigint :work_id, index: true
      t.foreign_key :works, on_delete: :cascade
      t.foreign_key :tags, on_delete: :cascade
      t.change_null :tag_id, false
    end

    reversible do |direction|
      direction.up do
        execute "update taggings set work_id = taggable_id"
      end

      direction.down do
        execute "update taggings set taggable_id = work_id, taggable_type = 'Work'"
      end
    end

    change_column_null :taggings, :work_id, false

    change_table :taggings, bulk: true do |t|
      t.remove_index column: [:taggable_type, :taggable_id]
      t.remove :taggable_id, type: :bigint
      t.remove :taggable_type, type: :string, limit: 255
    end
  end
end
