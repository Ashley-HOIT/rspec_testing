Before do

  begin
    Capybara.reset_sessions!
  rescue Exception => e
    puts e
  end

end


AfterStep do

end


After do |scenario|

  if scenario.failed?
    screenshot_file = "screenshots/#{scenario.name.downcase.tr(" /+<>,.:;|-", "_")[0..64]}.png"
    save_screenshot("#{screenshot_file}")
    puts "\n Saving screenshot for a failed scenario here" + " " + (File.expand_path(screenshot_file))
    puts "The failing feature can be found here" + " " + scenario.location + "\n"
  end

  begin
    wait_for_ajax
    page.driver.reset!
  rescue Exception => e
    puts e
  end

end

def wait_for_ajax
  Timeout.timeout(Capybara.default_max_wait_time) do
    loop until finished_all_ajax_requests?
  end
end

def finished_all_ajax_requests?
  begin
    page.evaluate_script("(typeof jQuery !== \"undefined\") ? jQuery.active : 0").zero?
  rescue Exception => e
    puts e
  end
end