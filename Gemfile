source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "image_processing", "~> 1.2"
gem "jsbundling-rails"
gem "puma", "~> 5.0"
gem "rails-i18n"
gem "sprockets-rails"
gem "pg"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "rodauth-i18n", "~> 0.7.1"
gem "rodauth-rails", "~> 1.9"
gem "sidekiq", "~> 7.1"
gem "telegram-bot-ruby", "~> 1.0"
gem "dotenv-rails"

group :development, :test do
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-factory_bot"
  gem "solargraph"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem "capistrano-bundler", "~> 1.2", require: false
  gem "capistrano-passenger", "~> 0.2", require: false
  gem "capistrano-rbenv", "~> 2.1", require: false
  gem "capistrano-sidekiq", require: false
end

group :test do
  gem "rspec-rails"
  gem "factory_bot"
end

group :development do
  gem "web-console"
end

group :production do; end
