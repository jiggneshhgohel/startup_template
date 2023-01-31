# frozen_string_literal: true

source "https://rubygems.org"

gem 'hanami', '~> 2.0'
gem 'hanami-router', '~> 2.0'
gem 'hanami-controller', '~> 2.0'
gem 'hanami-validations', '~> 2.0'

# TODO: Temporary using the `main` branch because using the released version `2.0.0.alpha8` causes conflict of `dry-core` version ( dry-core (>= 0.5, ~> 0.5) ) used by `hanami-controller` version ( dry-core (~> 1.0) )
gem 'hanami-view', github: "hanami/view", branch: 'main'
# TODO: Temporary using the `main` branch because using the released version `1.3.3` causes conflict of `hanami-utils` version ( hanami-utils (~> 1.3) ) used by `hanami-controller` version ( hanami-utils (~> 2.0) )
gem 'hanami-helpers', github: "hanami/helpers", branch: 'main'

#gem 'haml', '~> 6.0', '>= 6.0.10'
gem 'hamlit', '~> 3.0', '>= 3.0.3'

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem 'dry-transaction', '~> 0.15.0'
gem 'dry-transformer', '~> 1.0', '>= 1.0.1'

gem "puma"
gem "rake"

gem 'rom', '~> 5.3'
gem 'rom-sql', '~> 3.6', '>= 3.6.1'

gem "pg"

group :development, :test do
  gem "dotenv"
end

group :cli, :development do
  gem "hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end

group :development do
  gem "guard-puma"

  gem 'cssminify2'
  gem 'mini_racer'
  gem 'terser'
end

group :test do
  gem "rack-test"
  gem "database_cleaner-sequel"
  gem 'capybara'
end

