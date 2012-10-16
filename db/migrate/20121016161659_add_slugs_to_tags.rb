class AddSlugsToTags < ActiveRecord::Migration
  def change
    add_column :tags, :slug_en, :string
    add_column :tags, :slug_es, :string
    add_column :tags, :slug_ca, :string

    add_index :tags, :slug_ca
    add_index :tags, :slug_en
    add_index :tags, :slug_es
  end
end
