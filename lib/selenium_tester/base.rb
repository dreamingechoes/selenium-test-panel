module SeleniumTester

  class Base

    attr_reader :case_test, :driver

    def initialize(case_test)
      @case_test = case_test
      @driver = init_client
      run_steps
      end_session
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

    private def run_steps
      # Navigate to the CaseTest URL
      @driver.navigate.to(@case_test.url)

      # TODO: Complete this process
      # Iterate through the steps and execute them
      @case_test.steps.each do |step|
        begin
          step.datalayer = step.parse_datalayer(@driver.execute_script('return dataLayer')) if step.store_datalayer

          # Take the website screenshot
          f = File.open(@driver.save_screenshot('tmp/screenshot.png')) do |f|
            step.screenshot = f
          end
          step.response = 'OK'
        rescue Exception => e
          Rails.logger.info "[EXCEPTION][ERROR]: #{e}"
          step.response = e
        ensure
          step.save
        end
        File.delete(f)
      end
    end

    private def end_session
      @driver.quit
    end
  end

end
