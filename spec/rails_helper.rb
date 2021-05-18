# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('Not in test mode!') unless Rails.env.test?

require 'spec_helper'
require 'rspec/rails'
require 'factory_bot_rails'
require 'timecop'
require 'database_cleaner'
require 'capybara'

Dir[
  Rails.root.join('spec', 'support', '**', '*.rb')
].each { |f| require f }

::ActiveRecord::Migration.maintain_test_schema!

::FactoryBot.factories.clear
::FactoryBot.reload

RSpec.configure do |config|
  config.include ActiveJob::TestHelper
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods

  config.before(:each) do
    clear_enqueued_jobs
    ::ActionMailer::Base.delivery_method = :test
    ::ActionMailer::Base.perform_deliveries = true
    ::ActionMailer::Base.deliveries = []
  end

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include Rails.application.routes.url_helpers
end
