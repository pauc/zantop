class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.integer :content_id
      t.integer :content_type
      t.integer :position

      t.timestamps
    end

    add_index :sections, [:content_id, :content_type]

    Section.create_translation_table! title: :string, body: :text
  end

  def down
    drop_table :sections
    Section.drop_translation_table!
  end
end
