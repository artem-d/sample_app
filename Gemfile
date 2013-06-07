source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0.rc1'
gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', '3.0.1'

group :development, :test do
  gem 'debugger2', git: 'git@github.com:ko1/debugger2.git', require: 'debugger'
  gem 'sqlite3'
  gem 'rspec-rails', '2.13.1'
  gem 'activeresource', git: 'git://github.com/rails/activeresource', require: 'active_resource' 
  gem 'therubyracer', :platforms => :ruby
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.9'
end

group :development do
  gem 'annotate', '2.5.0'
end

group :test do
  gem 'selenium-webdriver', '2.0.0'
  gem 'capybara', '2.1.0'
  gem 'rb-inotify', '0.9.0'
  gem 'libnotify', '0.8.0'
  gem 'factory_girl_rails', '4.1.0'
end

gem 'sass-rails', '4.0.0.rc1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.0'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
end