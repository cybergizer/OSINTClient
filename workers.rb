require 'sidekiq'
require 'dotenv'
require 'sequel'
require_relative 'app/workers/seed_worker.rb'
require_relative 'app/workers/process_worker.rb'
require_relative 'config/initializers/sidekiq.rb'
require_relative 'config/initializers/osint_client.rb'

Dotenv.load

Sequel::Model.db = OSINTClient.db
Sequel::Model.plugin :whitelist_security
OSINTClient.db.extension :pg_inet

require_relative 'app/models/domain.rb'

ProcessWorker.perform_async
SeedWorker.perform_async
