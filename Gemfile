source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rest-client'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 3.32'
  gem 'database_cleaner', "~> 1.8"
  gem 'factory_bot_rails', "~> 5.2"
  gem 'ffaker'
  gem 'rack_session_access', "~> 0.2"
  gem 'rspec-rails', "~> 4.0"
  gem 'selenium-webdriver', "~> 3.142"
  gem 'timecop', "~> 0.9"
  gem 'webdrivers', "~> 4.4"
  gem 'webmock', "~> 3.8"
end
