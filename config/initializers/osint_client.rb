require 'logger'

module OSINTClient
  extend self
  def logger
    @_logger ||= ::Logger.new(STDOUT)
  end

  def db
    @_db ||= Sequel.connect(ENV['DATABASE_URL'], :logger => logger)
  end
end
