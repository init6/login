require "rubygems"
require "appium_lib"
require "pry"

caps = {
  caps: {
    "platformName": "iOS",
    "platformVersion": "14.4",
    "deviceName": "iPhone SE (2nd generation)",
    "automationName": "XCUITest",
    "useSimpleBuildTest": false,
    "browserName": "safari",
  },
  appium_lib: {
    wait: 10,
    server_url: "http://host.docker.internal:4723/wd/hub"
  }
}

RSpec.configure { |c|
  c.before(:each) {
    @driver = Appium::Driver.new(caps)
    @driver.start_driver
    Appium.promote_appium_methods Object
  }
  c.after(:each) {
    @driver.driver_quit
  }
}
