# frozen_string_literal: true

When(/^I post to "(.*)" with:$/) do |path, body|
  @last_response = Faraday.post(path, body: body)
end

When(/^I get "(.*)"$/) do |path|
  @last_response = Faraday.get path
end

And(/^the JSON array should have value (\d+) for key (.*) for all entries$/) do |value, key|
  expect(parse_json(last_json)).to all(include(key => value))
end
