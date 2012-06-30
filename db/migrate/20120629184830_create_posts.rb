class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :slug_en
      t.string :slug_es
      t.string :slug_ca

      t.timestamps
    end

    add_index :posts, :slug_en, unique: true
    add_index :posts, :slug_es, unique: true
    add_index :posts, :slug_ca, unique: true

    Post.create_translation_table! title: :string, text: :text
  end

  def down
    drop_table :posts
    Post.drop_translation_table!
  end
end
