# frozen_string_literal: true

`PGPASSWORD=#{ENV.fetch("ZANTOP_DATABASE_PASSWORD", "zantop")} \
 psql \
   -h ${ZANTOP_DATABASE_HOST:-localhost} \
   -U $ZANTOP_DATABASE_USER \
   -p ${ZANTOP_DATABASE_PORT:-5432} \
   -d ${ZANTOP_DATABASE_NAME:-zantop_development} \
 < db/dump.sql`

User.find_or_create_by!(email: "example@example.com") do |user|
  user.password = "secret"
end
