# frozen_string_literal: true

def db_dump
  db_config = ActiveRecord::Base.connection_db_config.configuration_hash

  dumped = system(
    { "PGPASSWORD" => db_config[:password].to_s },
    "pg_dump",
    "-h", db_config[:host],
    "-p", db_config[:port].to_s,
    "-U", db_config[:username],
    "-a",
    "--restrict-key=zantop",
    "--exclude-table-data=ar_internal_metadata",
    "--exclude-table-data=schema_migrations",
    db_config[:database],
    out: "db/dump.sql"
  )

  raise "Failed to dump #{db_config[:database]} to db/dump.sql" unless dumped
end

Rake::Task["db:migrate"].enhance do
  next unless Rails.env.development?

  db_dump
end

Rake::Task["db:rollback"].enhance do
  next unless Rails.env.development?

  db_dump
end
