require 'capybara/cucumber'
require 'rspec'
require 'selenium/webdriver'
require 'cucumber/rspec/doubles'
require 'rack'

# added Selenium webdriver as default
Capybara.default_driver = :selenium

chrome_switches = %w[--ignore-certificate-errors --disable-extensions --disable-popup-blocking --disable-translate]
caps_opts = {'chrome.switches' => chrome_switches,
             "chromeOptions" => {"args" => ["start-maximized", "disable-extensions"]}}
caps = Selenium::WebDriver::Remote::Capabilities.chrome(caps_opts)
caps.platform = :UNIX

opts = {
    :browser => :remote,
    :url => "http://37.97.206.118:5555/wd/hub",
    :desired_capabilities => caps
}

Capybara.register_driver :selenium_grid do |app|
  Capybara::Selenium::Driver.new(app, opts)
end

Capybara.default_driver = case ENV['BROWSER']
                            when 'selenium_grid'
                              :selenium
                            end
