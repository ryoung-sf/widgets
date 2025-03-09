require "test_helper"

class LintFactoriesTest < ActiveSupport::TestCase
  test "all factories can be created" do
    FactoryBot.lint traits: true
    assert true # needed to avoid a warning
  end
end
