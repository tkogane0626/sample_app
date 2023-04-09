source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", "1.12.0", require: false
gem "importmap-rails", "1.1.0"
gem "jbuilder", "2.11.5"
gem "pg", "1.4.5"
gem "puma", "5.6.4"
gem "rails", "7.0.4"
gem "sassc-rails", "2.1.2"
gem "sprockets-rails", "3.4.2"
gem "stimulus-rails", "1.0.4"
gem "turbo-rails", "1.1.1"

group :development, :test do
  gem "byebug", "11.1.3"
  gem "pry-byebug", "3.10.1"
  gem "pry-doc", "1.4.0"
  gem "pry-rails", "0.3.9"
  gem "pry-stack_explorer", "0.6.1"
  gem "rubocop", "1.48.1", require: false
  gem "rubocop-rails", "2.18.0", require: false
  gem "selenium-webdriver", "4.2.0"
  gem "webdrivers", "5.0.0"
end

group :producion do
  # Lint/EmptyBlock: Empty block detected.
end

# Windows ではタイムゾーン情報用の tzinfo-data gem が必要
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
