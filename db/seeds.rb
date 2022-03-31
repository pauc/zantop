# frozen_string_literal: true

`PGPASSWORD=#{ENV.fetch("ZANTOP_DATABASE_PASSWORD", "zantop")} \
 psql \
   -h ${ZANTOP_DATABASE_HOST:-localhost} \
   -U $ZANTOP_DATABASE_USER \
   -p ${ZANTOP_DATABASE_PORT:-5432} \
   -d ${ZANTOP_DATABASE_NAME:-zantop_development} \
 < db/initial_db_data.sql`

User.create!(email: "example@example.com", password: "secret")
