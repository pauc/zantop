class AddIntroToWorksTranslations < ActiveRecord::Migration
  def change
    add_column :work_translations, :intro, :string
  end
end
