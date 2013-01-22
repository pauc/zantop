class ChangeIntroColumnTypeInWorksTranslations < ActiveRecord::Migration
  def up
    change_column :work_translations, :intro, :text
  end

  def down
    change_column :work_translations, :intro, :string
  end
end
