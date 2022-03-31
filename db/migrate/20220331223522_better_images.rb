class BetterImages < ActiveRecord::Migration[7.0]
  def change
    change_table :images, bulk: true do |t|
      t.bigint :work_id, index: true
      t.foreign_key :works, on_delete: :cascade
    end

    reversible do |direction|
      direction.up do
        execute "update images set work_id = illustrated_id"
      end

      direction.down do
        execute "update images set illustrated_id = work_id, illustrated_type = 'Work'"
      end
    end

    change_table :images, bulk: true do |t|
      t.change_null :work_id, false
      t.remove_index column: [:illustrated_id, :illustrated_type]
      t.remove :illustrated_id, type: :bigint
      t.remove :illustrated_type, type: :string, limit: 255
    end
  end
end
