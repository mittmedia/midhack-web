ruby '2.2.2'


source 'https://rubygems.org'

gem 'bundler', '>= 1.8.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use Postgres as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "passenger"

# Used for i18n of page titles
gem 'page_title_helper'

# Used to identify the preferred language of the user
gem 'http_accept_language'

# Autoprefix css
gem 'autoprefixer-rails'

# Allow creating default values in code for Active Record Models.
gem 'attribute-defaults'


group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # To freeze time in tests for email-validation deadline
  gem 'timecop'

  gem 'rspec'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '1.3.0'
  gem 'factory_girl_rails'

  gem 'foreman'
  gem 'byebug'
  gem 'pry'
  gem 'web-console'
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'letter_opener'

  gem 'guard'
  gem 'listen'
  gem 'guard-rails', require: false
  gem 'guard-pow', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
  gem 'annotate'
  gem 'i18n-tasks', '~> 0.8.6'
end

