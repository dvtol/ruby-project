
Given /^startup the framework and visit otwn website/ do
	
  visit('http://otwn.nl/')
  sleep(3)
    page.save_screenshot('sample-otwn.png')
  sleep(3)
    page.driver.quit
end

