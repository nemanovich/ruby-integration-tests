# frozen_string_literal: true

require 'capybara/cucumber'
require 'capybara/rspec/matchers'
require 'rspec'
require 'rspec/collection_matchers'
require 'selenium-webdriver'

World(Capybara::DSL)
Capybara.run_server = false
Capybara.app_host = 'https://todomvc.com/examples/react'

Capybara.default_driver = :remote_chrome
Capybara.register_driver :remote_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://chrome:4444/wd/hub',
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => { 'args' => %w[--headless --no-sandbox] }
    )
  )
end
