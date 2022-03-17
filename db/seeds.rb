`psql -h ${ZANTOP_DATABASE_HOST:-localhost} -U $ZANTOP_DATABASE_USER -p ${ZANTOP_DATABASE_PORT:-5432} ${ZANTOP_DATABASE_NAME:-zantop_development} < db/initial_db_state.sql`
