
Given /^startup the framework and visit otwn website2/ do

  # open otwn website
  visit('http://otwn.nl/')
    page.save_screenshot('sample-otwn1.png')
end

When /^we click the 'hello world' link2/ do

  # click hello world link
  page.find(:xpath, '//*[@id="page"]/div/div/article/header/h2/a').click
  page.save_screenshot('sample-otwn2.png')
end

Then /^the hello word page opens and we quit the browser2/ do

  # quit driver to close the browser
  page.driver.quit
end
