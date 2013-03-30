source 'https://rubygems.org'

# Padrino Stable Gem
gem 'padrino', git: 'https://github.com/padrino/padrino-framework.git', branch: 'master'

# Component requirements
gem 'rabl'
gem 'yajl-ruby', require: 'yajl'
gem 'haml'
gem 'activemodel', require: 'active_model'
gem 'activesupport', require: 'active_support/time'
gem 'rake'
# gem 'rubyzip', git: 'https://github.com/aussiegeek/rubyzip.git', require: "zip/zip"
gem 'uuid'
gem 'json-jruby', require: 'json'
gem 'jruby-rack'
gem 'rack'

torquebox_version = "2.3.0"
gem 'torquebox-cache', torquebox_version
gem 'torquebox-messaging', torquebox_version
gem 'torquebox-rake-support', torquebox_version
gem 'torquebox', torquebox_version
gem 'padrino-rpm', git: 'https://github.com/6fusion/padrino-rpm.git'

group :deploy do
  gem 'colorize'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'capistrano-helpers'
  gem 'rest-client'
end

group :development, :test do
  gem 'trinidad'
end

# Test requirements
group :test do
	gem 'mocha', group: 'test'
	gem 'rspec', group: 'test'
	gem 'rack-test', require: 'rack/test', group: 'test'
end