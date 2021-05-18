Capybara.always_include_port = true

RSpec.configure do |config|
  config.include Capybara::DSL

  Capybara.server = :puma, { Silent: true }

  config.before(:each, type: :system) do
    driven_by(:selenium_chrome_headless)
  end

  config.before(:each, type: :system, js: true) do
    driven_by(:selenium_chrome)
  end
end
