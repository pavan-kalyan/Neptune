require 'selenium/webdriver'
require 'cucumber/rails'

Capybara.default_max_wait_time = 20
# Capybara.default_driver = :selenium
Capybara.run_server = false