# frozen_string_literal: true

# Mutant forks worker processes that would otherwise share the Postgres
# connection (and test database) inherited from the parent. Give each worker a
# fresh connection, pointing workers 1+ at their own database
# (<base>_1_test, <base>_2_test, …) so parallel runs cannot interfere.
# Create those databases once with `rake mutant:setup`.
MUTANT_WORKER_SETUP = proc do |index:|
  ActiveRecord::Base.connection_handler.clear_all_connections!

  db_config = ActiveRecord::Base.connection_db_config.configuration_hash

  unless index.zero?
    db_config = db_config.merge(database: db_config[:database].sub(/_test\z/, "_#{index}_test"))
  end

  ActiveRecord::Base.establish_connection(db_config)
end

hooks.register(:mutation_worker_process_start, &MUTANT_WORKER_SETUP)
hooks.register(:test_worker_process_start, &MUTANT_WORKER_SETUP)
