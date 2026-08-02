# frozen_string_literal: true

# Regenerates db/dump.sql, the data-only dump db/seeds.rb restores.
#
# ActiveStorage variants are derived data, and their files are never shipped:
# uploads/ is not in the repository. A variant record without its file is
# worse than no record at all — Rails takes the record as proof the variant
# was processed and redirects to a URL that 404s instead of regenerating it,
# so a stale row breaks the image for good. The dump therefore carries the
# originals only and lets every checkout build its own variants.
module DatabaseDump
  PATH = "db/dump.sql"
  VARIANT_RECORD_TYPE = "ActiveStorage::VariantRecord"
  COPY_HEADER = /\ACOPY public\.(?<table>\S+) \((?<columns>.+)\) FROM stdin;$/
  COPY_TERMINATOR = "\\.\n"

  class << self
    def call(path = PATH)
      dump(path)
      strip_derived_active_storage_rows(path)
    end

    def strip_derived_active_storage_rows(path = PATH)
      lines = File.readlines(path)
      blob_ids = variant_blob_ids(lines)
      kept = []

      each_dump_line(lines) do |line, table, row|
        kept << line unless derived?(table, row, blob_ids)
      end

      File.write(path, kept.join)
    end

    private

    def dump(path)
      db_config = ActiveRecord::Base.connection_db_config.configuration_hash

      # Runs inside the db container so pg_dump always matches the server version;
      # the host client (17.x) cannot dump a Postgres 18 server.
      dumped = system(
        "docker", "compose", "exec",
        "-T",
        "-e", "PGPASSWORD=#{db_config[:password]}",
        "db",
        "pg_dump",
        "-U", db_config[:username],
        "-a",
        "--restrict-key=zantop",
        "--exclude-table-data=ar_internal_metadata",
        "--exclude-table-data=schema_migrations",
        # This repository is public and db/dump.sql is committed, so a users row
        # publishes a bcrypt digest to anyone who clones it. Cost 12 makes brute
        # force impractical but does nothing for a guessable password, and the
        # app has no privilege tier below "signed in" — one credential is the
        # whole admin area. db/seeds.rb creates the development user instead,
        # which is what its find_or_create_by! was always for; it simply never
        # fired while the dump supplied the row first.
        "--exclude-table-data=users",
        db_config[:database],
        out: path
      )

      raise "Failed to dump #{db_config[:database]} to #{path}" unless dumped
    end

    # The blobs holding the variant files themselves, reachable only through the
    # attachments that tie them to their variant record.
    def variant_blob_ids(lines)
      ids = Set.new

      each_dump_line(lines) do |_line, table, row|
        next unless table == "active_storage_attachments"

        ids << row["blob_id"] if row["record_type"] == VARIANT_RECORD_TYPE
      end

      ids
    end

    def derived?(table, row, blob_ids)
      case table
      when "active_storage_variant_records" then true
      when "active_storage_attachments" then row["record_type"] == VARIANT_RECORD_TYPE
      when "active_storage_blobs" then blob_ids.include?(row["id"])
      else false
      end
    end

    # Walks a data-only pg_dump, yielding every line together with the table it
    # belongs to and its values keyed by column — both nil outside a COPY block.
    def each_dump_line(lines)
      table = nil
      columns = nil

      lines.each do |line|
        header = COPY_HEADER.match(line)

        if header
          table = header[:table]
          columns = header[:columns].delete('"').split(", ")
          yield line, nil, nil
        elsif line == COPY_TERMINATOR
          table = nil
          yield line, nil, nil
        elsif table
          yield line, table, columns.zip(line.chomp.split("\t", -1)).to_h
        else
          yield line, nil, nil
        end
      end
    end
  end
end
