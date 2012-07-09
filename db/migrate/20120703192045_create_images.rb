class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :work_id
      t.integer :position

      t.timestamps
    end
  end
end
