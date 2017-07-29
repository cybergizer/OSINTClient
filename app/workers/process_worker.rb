require './init.rb'
require 'json'
DEFAULT_HEADERS = { auth_token: ENV['TOKEN'], content_type: :json, accept: :json }
EXPORT_URL = ENV['SERVER_URL'] + '/export'
UPLOAD_URL = ENV['SERVER_URL'] + '/upload'

class ProcessWorker
  include Sidekiq::Worker
  def perform
    response = RestClient.get(EXPORT_URL, DEFAULT_HEADERS)
    domains = JSON.parse(response)['domains']
    return if domains.empty?
    domain_name = domains.first['name']
    # do something
    ip_ranges = []
    request_body = { domain_name => ip_ranges }
    RestClient.post(UPLOAD_URL, request_body, DEFAULT_HEADERS)
  rescue => e
    exception_info =  "\n" + e.message + "\n" + e.backtrace.join("\n")
    OSINTClient.logger.error "Request failed: #{exception_info}"
  end
end
