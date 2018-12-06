source 'https://rubygems.org'

gem 'rails', '4.1.6'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.18'

# Bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
gem 'font-awesome-sass'

# Use Autoprefixer with Bootstrap to add browser vendor prefixes automatically
gem 'autoprefixer-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'bootstrap-datepicker-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]

# Carrierwave for uploads - mini_magick for carrierwave!
gem 'carrierwave'
gem "mini_magick"

# Devise for Authentication and CanCanCan for roles
gem 'devise'
gem 'cancancan', '~> 1.9'

gem 'slim-rails'

# Redactor editor
gem 'redactor-rails'

# Ancestory for categories and filters
gem 'ancestry', "~> 2.1"

# truncate_html
gem 'truncate_html'

# Will_paginate for pagination
gem 'will_paginate', '~> 3.0.6'

# new relic for application monitoring
# gem 'newrelic_rpm'

# dynamic_sitemaps for sitemap
gem 'dynamic_sitemaps'

# whenever for cron
gem 'whenever', :require => false

# OpsCare gems
gem 'asset_sync'
gem 'fog-aws'
gem "ops_care", git: "git@github.com:reinteractive/OpsCare.git", branch: "master"

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'simplecov'
end

# Use Capistrano for deployment
group :development do
  gem 'capistrano',  '~> 3.3.5'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-passenger'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'byebug'
  gem 'dotenv-rails'
end
