# frozen_string_literal: true

def db_dump
  db_host = ENV.fetch("ZANTOP_DATABASE_HOST") { "localhost" }
  db_port = ENV.fetch("ZANTOP_DATABASE_PORT") { 5432 }
  db_username = ENV.fetch("ZANTOP_DATABASE_USER")

  `pg_dump -h #{db_host} -U #{db_username} -p #{db_port} -a zantop_development > db/dump.sql`
end

Rake::Task["db:migrate"].enhance do
  next unless Rails.env.development?

  db_dump
end

Rake::Task["db:rollback"].enhance do
  next unless Rails.env.development?

  db_dump
end
