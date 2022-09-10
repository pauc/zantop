# frozen_string_literal: true

require "fileutils"

desc "Migrates images from the old Carrierwave system to ActiveStorage"
task migrate_images: :environment do
  tmp_dir = Rails.root.join("tmp/uploads")
  FileUtils.mkdir_p(tmp_dir)

  Image.order(id: :asc).all.each do |image_record|
    $stdout.puts("Processing image ##{image_record.id}")
    next if image_record.deprecated_image.nil?

    source_path = Rails.root.join("legacy_uploads",
                                  "work_#{image_record.work_id}",
                                  "img_#{image_record.id}",
                                  image_record.deprecated_image)

    tmp_path = tmp_dir.join(image_record.deprecated_image)

    ImageOptimizer.new.call(source: source_path, destination: tmp_path)

    File.open(tmp_path) do |file|
      image_record.image.attach(io: file, filename: image_record.deprecated_image)
    end

    $stdout.puts("Done!")
  end

  FileUtils.remove_dir(tmp_dir, true)
end
