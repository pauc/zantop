class TranslateImages < ActiveRecord::Migration
  def up
    Image.create_translation_table! credits: :text
  end

  def down
    Image.drop_translation_table!
  end
end
