# frozen_string_literal: true

db_config = ActiveRecord::Base.connection_db_config.configuration_hash

restored = system(
  { "PGPASSWORD" => db_config[:password].to_s },
  "psql",
  "-h", db_config[:host],
  "-p", db_config[:port].to_s,
  "-U", db_config[:username],
  "-d", db_config[:database],
  "-f", "db/dump.sql",
  out: File::NULL
)

raise "Failed to restore db/dump.sql into #{db_config[:database]}" unless restored

User.find_or_create_by!(email: "example@example.com") do |user|
  user.password = "secret"
end
