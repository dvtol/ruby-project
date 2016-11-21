require 'capybara'
require 'capybara/dsl'


# DSL is required to use capybara functionality like e.g. page
RSpec.configure do |config|
  config.include Capybara::DSL, :type => :feature
end
