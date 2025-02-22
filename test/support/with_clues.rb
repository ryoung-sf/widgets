module TestSupport
  module WithClues
    # Wrap any assertion with this method to get more
    # useful context and diagnostics when a test is
    # unexpectedly failing
    def with_clues(&block)
      block.()
    rescue Exception => ex
      puts "[ with_clues ] Test failed: #{ex.message}"
      if page.driver.respond_to?(:browser)
        if page.driver.browser.respond_to(:logs)
          logs = page.driver.browser.logs
          browser_logs = logs.get(:browser)
          browser_logs.each do |log|
            puts log.message
          end
          puts "[ with_clues] } END Browser Logs"
        else
          puts "[ with_clues ] NO BROWSER LOGS: " +
               "page.driver.browser" +
               "#{page.driver.brower.class} " +
               "does not respond to #logs"
        end
      else
        puts "[ with_clues ] NO BROWSER LOGS: page.driver " +
             "#{page.driver.class} does not respond to #browser"
      end
      puts "[ with_clues ] HTML {"
      puts
      puts page.html
      puts
      puts "[ with_clues ] } END HTML"
      raise ex
    end
  end
end
