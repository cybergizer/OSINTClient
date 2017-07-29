require 'sidekiq'
require 'sidekiq-cron'
require 'dotenv'
require 'sequel'
require 'rest-client'
require_relative 'config/initializers/sidekiq.rb'
require_relative 'config/initializers/osint_client.rb'

Dotenv.load

Sequel::Model.db = OSINTClient.db
Sequel::Model.plugin :whitelist_security
OSINTClient.db.extension :pg_inet

require_relative 'app/models/domain.rb'
