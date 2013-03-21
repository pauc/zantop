class RemoveIntroFromWorks < ActiveRecord::Migration
  def up
    remove_column :work_translations, :intro
  end

  def down
    add_column :work_translations, :intro, :text
  end
end
