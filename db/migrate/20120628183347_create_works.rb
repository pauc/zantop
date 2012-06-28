class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.string :type
      t.date :realized
      t.string :where
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end
end
