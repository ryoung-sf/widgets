require "test_helper"

Selenium::WebDriver::Chrome::Service.driver_path =
  "/opt/homebrew/bin/chromedriver"

Capybara.register_driver :root_headless_chrome do |app|
  options = Selenium::WebDriver::Options.chrome(
    args: [
      "headless",
      "disable-gpu",
      "no-sandbox",
      "disable-dev-shm-usage",
      "whitelisted-ips"
    ],
    logging_prefs: { browser: "ALL" },
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end # register_driver

require "support/with_clues"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSupport::WithClues
  driven_by :rack_test
end

# Base test class for system tests requiring Javascript
class BrowserSystemTestCase < ApplicationSystemTestCase
  driven_by :root_headless_chrome, screen_size: [ 1400, 1400 ]
end
