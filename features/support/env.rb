require 'selenium/webdriver'

url = "http://otwn.nl:4444/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new
Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver'

capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
capabilities['browserName'] = ENV['SELENIUM_BROWSER'] || 'chrome'

browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

at_exit do
  browser.quit
end