# frozen_string_literal: true

# Mutant runs one kill job per processor by default; each worker connects to
# its own copy of the test database (see config/mutant_hooks.rb). Worker 0
# uses the regular test database, so only workers 1+ need an extra one.
def mutant_worker_database_names
  require "etc"

  base = ENV.fetch("ZANTOP_DATABASE_NAME", "zantop")
  (1...Etc.nprocessors).map { |index| "#{base}_#{index}" }
end

namespace :mutant do
  desc "Create the per-worker test databases used by mutant"
  task setup: :environment do
    mutant_worker_database_names.each do |name|
      puts "Preparing #{name}_test..."
      sh({ "ZANTOP_DATABASE_NAME" => name, "RAILS_ENV" => "test" }, "bin/rails db:test:prepare")
    end

    puts "Done. Run mutant with: bundle exec mutant run -- 'Work'"
  end

  desc "Drop the per-worker test databases (keeps the regular test database)"
  task drop: :environment do
    mutant_worker_database_names.each do |name|
      puts "Dropping #{name}_test..."
      sh({ "ZANTOP_DATABASE_NAME" => name, "RAILS_ENV" => "test" }, "bin/rails db:drop")
    end
  end
end
