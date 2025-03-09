require "test_helper"
require "ostruct"

class ApplicationHelperTest < ActionView::TestCase
  test "styled_widget_id < 6 digits, pad with 0's" do
    widget = FactoryBot.create(:widget, id: "1234")
    rendered_markup = styled_widget_id(widget)

    assert_match /\D0012\.34\D/, rendered_markup
    assert rendered_markup.html_safe?
  end

  test "styled_widget_id >= 6 digits, no padding" do
    widget = FactoryBot.create(:widget, id: "987654")
    rendered_markup = styled_widget_id(widget)

    assert_match /\D9876\.54\D/, rendered_markup
    assert rendered_markup.html_safe?
  end
end
