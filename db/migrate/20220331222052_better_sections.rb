# frozen_string_literal: true

class BetterSections < ActiveRecord::Migration[7.0]
  def change
    change_table :sections, bulk: true do |t|
      t.bigint :work_id, index: true
      t.foreign_key :works, on_delete: :cascade
    end

    reversible do |direction|
      direction.up do
        execute "update sections set work_id = content_id"
      end

      direction.down do
        execute "update sections set content_id = work_id"
      end
    end

    change_table :sections, bulk: true do |t|
      t.change_null :work_id, false
      t.remove_index column: [:content_id, :content_type]
      t.remove :content_id, type: :bigint
      t.remove :content_type, type: :string
    end
  end
end
