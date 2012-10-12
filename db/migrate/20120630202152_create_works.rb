class CreateWorks < ActiveRecord::Migration
  def up
    create_table :works do |t|
      t.string :slug_en
      t.string :slug_es
      t.string :slug_ca
      t.date :realization_date
      t.string :dimensions
      t.integer :position
      t.string :type

      t.timestamps
    end

    add_index :works, :slug_en, unique: true
    add_index :works, :slug_es, unique: true
    add_index :works, :slug_ca, unique: true

    Work.create_translation_table! title: :string,
                                   description: :text,
                                   techniques: :string,
                                   place: :string
  end

  def down
    drop_table :works
    Work.drop_translation_table!
  end
end
