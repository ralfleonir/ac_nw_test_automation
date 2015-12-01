# singleton parent page with required data to run the tests.
require 'singleton'
require_relative 'browser'
require_relative '../lib/home_page'
require_relative '../lib/random_page'
require_relative 'screenshot_tool'

class ParentPage
  include Singleton

  attr_reader :browser, :dateTime, :log, :screenshot_tool,
    :home_page, :required_test_data, :expected_data, :test_messages, :random_page

  def initialize
    @browser = Browser.instance.browser
    @browser.goto("#{ENV['ACNW_STAGING']}")
    @dateTime = DateTime.parse(Time.now.to_s).strftime(" on %F at %T")
    @logFile = "ac_website_log--#{@dateTime}.log"
    @log = Logger.new("#{ENV['LOGGER']}/#{@logFile}")
    @screenshot_tool = TakeScreenshot.new(@browser, true)
    @home_page = HomePage.new(@browser, true)
    @random_page = RandomPage.new(@browser, true)
    @required_test_data = YAML.load_file("#{ENV['USER_INPUT']}/required_test_data.yaml")
    @expected_data = YAML.load_file("#{ENV['EXPECT_TEST_DATA']}/expected_data.yaml")
    @test_messages = YAML.load_file("#{ENV['TEST_MESSAGES']}/test_messages.yaml")
  end

  def after_test(message)
    log.info(message+DateTime.parse(Time.now.to_s).strftime(" on %F at %T"))
  end
end
