class CreateVisualAndActionWorks < ActiveRecord::Migration
  def up
    create_table :visual_works do |t|
      t.string :slug_en
      t.string :slug_es
      t.string :slug_ca
      t.date :realization_date
      t.string :dimensions
      t.integer :position

      t.timestamps
    end

    add_index :visual_works, :slug_en, unique: true
    add_index :visual_works, :slug_es, unique: true
    add_index :visual_works, :slug_ca, unique: true

    VisualWork.create_translation_table! title: :string, 
                                         description: :text,
                                         techniques: :string

    create_table :action_works do |t|
      t.string :slug_en
      t.string :slug_es
      t.string :slug_ca
      t.date :realization_date
      t.integer :position

      t.timestamps
    end

    add_index :action_works, :slug_en, unique: true
    add_index :action_works, :slug_es, unique: true
    add_index :action_works, :slug_ca, unique: true

    ActionWork.create_translation_table! title: :string,
                                         description: :text,
                                         place: :string
  end

  def down
    drop_table :visual_works
    VisualWork.drop_translation_table!
    drop_table :action_works
    ActionWork.drop_translation_table!
  end
end
