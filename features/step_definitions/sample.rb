
Given /^@startup the framework and visit otwn website/ do

  # open otwn website
  visit('http://otwn.nl/')asdasd
  sleep(2)
    page.save_screenshot('sample-otwn1.png')
  sleep(2)
end

When /^@we click the 'hello world' link/ do

  # click hello world link
  page.find(:xpath, '//*[@id="post-1"]/header/h1/a').click
  sleep(2)
  page.save_screenshot('sample-otwn2.png')
end

When /^@the hello word page opens and we quit the browser/ do

  # quit driver to close the browser
  page.driver.quit
end
