class DeprecateColumnImageOnImages < ActiveRecord::Migration[7.0]
  def change
    rename_column :images, :image, :deprecated_image
  end
end
