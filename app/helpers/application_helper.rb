module ApplicationHelper
  def styled_widget_id(widget)
    content_tag(:span,
                widget.widget_id.to_s.rjust(7, "0"),
                style: "font-family: monospace")
  end
end
