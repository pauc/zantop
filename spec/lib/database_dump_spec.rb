# frozen_string_literal: true

require "database_dump"

RSpec.describe DatabaseDump do
  def copy_block(table, columns, rows)
    [
      "COPY public.#{table} (#{columns.join(', ')}) FROM stdin;\n",
      *rows.map { |row| "#{row.join("\t")}\n" },
      "\\.\n"
    ].join
  end

  def blobs
    copy_block(
      "active_storage_blobs",
      %w[id key filename],
      [
        [1, "originalkey", "flowers.jpg"],
        [2, "variantkey", "flowers.jpg"]
      ]
    )
  end

  def attachments
    copy_block(
      "active_storage_attachments",
      %w[id name record_type record_id blob_id],
      [
        [1, "image", "Image", 7, 1],
        [2, "image", "ActiveStorage::VariantRecord", 1, 2]
      ]
    )
  end

  def variant_records
    copy_block(
      "active_storage_variant_records",
      %w[id blob_id variation_digest],
      [[1, 1, "M91c9VrFpBr494LVqt2ovQeA/lk="]]
    )
  end

  def images
    copy_block("images", ["id", "\"position\"", "work_id"], [[7, 1, 3]])
  end

  let(:path) { Rails.root.join("tmp/database_dump_spec.sql").to_s }

  let(:dump) do
    "--\n-- PostgreSQL database dump\n--\n\n#{blobs}\n#{attachments}\n#{variant_records}\n#{images}"
  end

  before { File.write(path, dump) }

  after { FileUtils.rm_f(path) }

  describe ".strip_derived_active_storage_rows" do
    subject(:stripped) do
      described_class.strip_derived_active_storage_rows(path)
      File.read(path)
    end

    it "drops every variant record" do
      expect(stripped).not_to include "M91c9VrFpBr494LVqt2ovQeA/lk="
    end

    it "keeps the COPY block the variant records were in" do
      expect(stripped).to include "COPY public.active_storage_variant_records"
    end

    it "drops the attachments tying variant files to their variant record" do
      expect(stripped).not_to include "ActiveStorage::VariantRecord"
    end

    it "keeps the attachments of the originals" do
      expect(stripped).to include "1\timage\tImage\t7\t1\n"
    end

    it "drops the blobs holding the variant files" do
      expect(stripped).not_to include "variantkey"
    end

    it "keeps the blobs holding the originals" do
      expect(stripped).to include "1\toriginalkey\tflowers.jpg\n"
    end

    it "leaves the other tables alone" do
      expect(stripped).to include images
    end

    it "leaves everything outside the COPY blocks alone" do
      expect(stripped).to start_with "--\n-- PostgreSQL database dump\n--\n\n"
    end

    it "is idempotent" do
      described_class.strip_derived_active_storage_rows(path)

      expect { described_class.strip_derived_active_storage_rows(path) }
        .not_to change { File.read(path) }
    end
  end
end
