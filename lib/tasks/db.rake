# frozen_string_literal: true

require_relative "../database_dump"

namespace :db do
  desc "Regenerates db/dump.sql from the development database"
  task dump: :environment do
    DatabaseDump.call
  end
end

Rake::Task["db:migrate"].enhance do
  next unless Rails.env.development?

  DatabaseDump.call
end

Rake::Task["db:rollback"].enhance do
  next unless Rails.env.development?

  DatabaseDump.call
end
