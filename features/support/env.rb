# frozen_string_literal: true

require 'json_spec/cucumber'
require 'capybara/cucumber'
require 'faraday'
require 'faraday_middleware'

Faraday.default_connection = Faraday.new do |conn|
  conn.url_prefix = 'https://jsonplaceholder.typicode.com'
  conn.request :url_encoded
  conn.response :json
  conn.adapter Faraday.default_adapter
end

JsonSpec.configure do
  exclude_keys 'created_at', 'updated_at' # equal "include id key"
end

module RSpecAll
  def all(expected)
    RSpec::Matchers::BuiltIn::All.new(expected)
  end
end

World(RSpecAll)

def last_json
  @last_response.body.to_json
end

