ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# Set up Sidekiq testing modes. See
# https://github.com/mperham/sidekiq/wiki/Testing
require "sidekiq/testing"
Capybara.configure do |config|
  # This allows helpers like click_on to locate
  # any object by data-testid in addition to
  # built-in selector-like values
  config.test_id = "data-testid"
end

require "support/confidence_check"

module ActiveSupport
  class TestCase
    include TestSupport::ConfidenceCheck
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
