
Given /^startup the framework and visit otwn website/ do
	
  visit('http://otwn.nl/')
  sleep(4)
    page.save_screenshot('sample-otwn.png')
  sleep(4)
    page.driver.quit
end

