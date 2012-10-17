class AddImagesCountToWorks < ActiveRecord::Migration
  def up
    add_column :works, :images_count, :integer, default: 0

    Work.all.each do |w|
      Work.update_counters w.id, images_count: w.images.length
    end
  end

  def down
   remove_column :works, :images_count
  end
end
