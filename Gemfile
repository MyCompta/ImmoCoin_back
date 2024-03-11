# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'devise-jwt', '~> 0.11.0'

gem 'jsonapi-serializer', '~> 2.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'brakeman', '~> 6.1', '>= 6.1.2'
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv-rails', groups: [:development, :test]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3', require: false
  gem 'faker', '~> 3.2'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.2'
  gem 'rspec-rails', '~> 6.1', '>= 6.1.1', require: false
  gem 'rubocop-performance', '~> 1.20', '>= 1.20.2', require: false
  gem 'rubocop-rails', '~> 2.24', require: false
  gem 'rubocop-rspec', '~> 2.27', '>= 2.27.1', require: false
  gem 'shoulda-matchers', '~> 6.1'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'bundle-audit', '~> 0.1.0'
  gem 'database_consistency', '~> 1.7', '>= 1.7.23', require: false
  gem 'rubycritic', '~> 4.9', require: false
end

gem "dockerfile-rails", ">= 1.6", :group => :development
