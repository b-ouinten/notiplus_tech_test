# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.disable_monkey_patching!
  config.profile_examples = 3
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.alias_it_should_behave_like_to :behave_like, 'verify'
  config.full_backtrace = true
  config.warnings = false
end
