source 'https://rubygems.org'
ruby '2.3.0'
gem 'sinatra'
gem 'thin'
gem 'typhoeus'
gem "koala"
gem 'oauth2'


dev_gemfile = File.expand_path("Gemfile.dev.rb", __dir__)
eval_gemfile(dev_gemfile) if File.exist?(dev_gemfile)
