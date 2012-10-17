class AddTaggingsCountToTags < ActiveRecord::Migration
  def up
    add_column :tags, :taggings_count, :integer, default: 0

    Tag.all.each do |t|
      Tag.update_counters t.id, taggings_count: t.taggings.length
    end
  end

  def down
   remove_column :tags, :taggings_count
  end
end
