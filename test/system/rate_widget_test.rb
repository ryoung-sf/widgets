require "application_system_test_case"

class RateWidgetsTest < BrowserSystemTestCase
  test "rating a widget shows our rating inline" do
    widget = FactoryBot.create(:widget)
    visit widget_path(widget)

    click_on "2"

    assert_selector "widget-rating [role=status]",
                    text: /thanks for rating.*2/im
  end
end
