require 'capybara/cucumber'
require 'rspec'
require 'selenium/webdriver'
require 'cucumber/rspec/doubles'

# added grid hub for FreeBSD (remote testing)
#url = "http://otwn.nl:4444/wd/hub"

#capabilities = Selenium::WebDriver::Remote::Capabilities.new

#capabilities['platform'] = ENV['PLATFORM'] || 'ANY'
#capabilities['browserName'] = ENV['BROWSER'] || 'phantomjs'

#browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

#at_exit do
#  browser.quit
#end

# added Chrome for Windows (local testing)
Capybara.register_driver :phantomjs do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.phantomjs()
  Capybara::Selenium::Driver.new(app, {:browser => :phantomjs, :desired_capabilities => caps})
end

Capybara.default_driver = case ENV['BROWSER']
                            when 'phantomjs'
                              :phantomjs
                          end

