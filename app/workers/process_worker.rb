class ProcessWorker
  include Sidekiq::Worker
  def perform
    # do something
  end
end
