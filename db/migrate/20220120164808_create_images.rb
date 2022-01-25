class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :illustrated_id
      t.string :illustrated_type
      t.integer :position

      t.timestamps
    end
    add_index :images, [:illustrated_id, :illustrated_type]
  end
end
