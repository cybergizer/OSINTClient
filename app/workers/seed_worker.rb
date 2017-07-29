require './init.rb'
class SeedWorker
  include Sidekiq::Worker
  def perform
    # do something
  end
end
