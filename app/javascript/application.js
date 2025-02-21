// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"

// The default of 500ms is too long and
// users can lose the causal link between clicking
// a link and seeing the browser respond
Turbo.config.drive.progressBarDelay = 100

import "controllers"

import WidgetRatingButtons from "widget_rating"
document.addEventListener("DOMContentLoaded", () => {
  customElements.define("widget-rating",WidgetRatingButtons)
})