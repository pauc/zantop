# frozen_string_literal: true

def db_dump
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
