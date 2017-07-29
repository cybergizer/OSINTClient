$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../..'))
require 'dotenv'
require 'sequel'
require_relative '../../config/initializers/osint_client.rb'
Dotenv.load

namespace :db do
  desc 'Migrates database'
  task :migrate do
    Sequel.extension :migration
    migrations = Pathname.new(File.join(__FILE__, '../../..')).expand_path.join('db/migrations')
    Sequel::Migrator.run(OSINTClient.db, migrations, use_transactions: true)
  end
end
