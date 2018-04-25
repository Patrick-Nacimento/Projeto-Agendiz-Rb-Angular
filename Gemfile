source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.0'
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'execjs'
gem 'therubyracer'

# NO SQL background process
gem 'resque'
gem 'resque-scheduler'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#Soft delete
gem 'paranoia'

#Enum
gem 'enumerate_it'

gem 'cancancan'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'shoulda-context'
  gem 'shoulda'
  gem 'mocha'

  gem 'faker'
  gem 'cpf_faker'
  gem 'company_data_faker'
end

# Modules
gem 'api_base', path: '../api_base'
gem 'api_auth', path: '../api_auth'
# gem 'angular_base_material', path: '../../../modules/angular_base_material'

# gem 'api_base', git: 'git@gitlab.velow.com.br:modules/api_base.git', branch: 'url_auth_key'
# gem 'api_auth', git: 'git@gitlab.velow.com.br:modules/api_auth.git', branch: 'new_design'
gem 'angular_base_material', git: 'git@gitlab.velow.com.br:modules/angular_base_material.git', branch: 'new_design'

