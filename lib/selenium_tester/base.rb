module SeleniumTester

  class Base

    attr_reader :case_test, :driver

    def initialize(case_test)
      @case_test = case_test
      @driver = init_client
    end

    def end_session
      @driver.quit
    end

    private def capabilities
      caps = Selenium::WebDriver::Remote::Capabilities.new
      caps["browser"] = "Chrome"
      caps["browser_version"] = "53.0"
      caps["os"] = "Windows"
      caps["os_version"] = "10"
      caps["browserstack.debug"] = "true"
      caps["name"] = @case_test.title
      caps
    end

    private def init_client
      username = ConfigElement.where(key: "browserstack_username").first.value
      userkey = ConfigElement.where(key: "browserstack_key").first.value
      client = Selenium::WebDriver::Remote::Http::Default.new
      driver = Selenium::WebDriver.for(:remote,
        :url => "http://#{username}:#{userkey}@hub-cloud.browserstack.com/wd/hub",
        :desired_capabilities => capabilities)
    end

  end

end
