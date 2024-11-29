require 'capybara/cucumber'
require 'selenium-webdriver'
require 'httparty'
require_relative '../utils/api_client'
require_relative '../utils/math_utils'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://demo.applitools.com'