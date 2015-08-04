# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_summary_stock'
  s.version     = '3.0.0'
  s.summary     = 'A Spree extension that summarizes all Spree::StockLocation into one location.'
  s.description = 'A Spree extension that summarizes all Spree::StockLocation into one location.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Daniel Dixon'
  s.email     = 'code@danieldixon.com'
  s.homepage  = 'http://www.danieldixon.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
