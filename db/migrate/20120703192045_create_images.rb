class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :illustrated_id
      t.string :illustrated_type

      t.timestamps
    end
  end
end
