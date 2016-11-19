require 'capybara/cucumber'
require 'rspec'
require 'selenium/webdriver'
require 'cucumber/rspec/doubles'

#url = "http://otwn.nl:4444/wd/hub"

#capabilities = Selenium::WebDriver::Remote::Capabilities.new

#capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
#capabilities['browserName'] = ENV['SELENIUM_BROWSER'] || 'chrome'

#browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

#at_exit do
#  browser.quit
#end

# added Chrome for Windows (local testing)
Capybara.register_driver :chrome do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome()

  Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})
end

Capybara.default_driver = case ENV['BROWSER']
                            when 'chrome'
                              :chrome
                          end

