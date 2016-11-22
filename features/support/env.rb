require 'capybara/cucumber'
require 'rspec'
require 'selenium/webdriver'
require 'cucumber/rspec/doubles'


url = 'http://otwn.nl:4444/wd/hub'

# added phantomjs driver (headless) for remote testing through selenium grid
Capybara.register_driver :phantomjs do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.phantomjs()
  Capybara::Selenium::Driver.new(app, {:browser => :remote, :url => url, :desired_capabilities => caps})
end

# added FireFox driver for remote testing through selenium grid
Capybara.register_driver :firefox do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.firefox()
  Capybara::Selenium::Driver.new(app, {:browser => :remote, :url => url, :desired_capabilities => caps})
end


# added Chrome driver for local testing purposes
chrome_switches = %w[--ignore-certificate-errors --disable-extensions --disable-popup-blocking --disable-translate]
caps_opts = {'chrome.switches' => chrome_switches,
             'chromeOptions' => {'args' => ["start-maximized", "disable-extensions"]}}

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps_opts)
end

Capybara.default_driver = case ENV['BROWSER']
                            when 'phantomjs'
                              :phantomjs
                            when 'chrome'
                              :chrome
                            when 'firefox'
                              :firefox
                            else
                              :phantomjs
                          end
