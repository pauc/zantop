class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.timestamps
    end

    Tag.create_translation_table! name: :string
  end
end
