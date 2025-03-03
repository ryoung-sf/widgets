module ApplicationHelper
  def styled_widget_id(widget)
    content_tag(:span,
                widget.user_facing_identifier.rjust(7, "0"),
                style: "font-family: monospace")
  end
end
