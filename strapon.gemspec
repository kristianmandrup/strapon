$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "strapon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "strapon"
  s.version     = Strapon::VERSION
  s.authors     = ["matt mischewski"]
  s.email       = ["matt.mischewski@gmail.com"]
  s.homepage    = "http://www.dreaminering.com"
  s.summary     = "Starter for RIA's in rails"
  s.description = "Generators and CSS helpers."

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.8"
  s.add_development_dependency "capybara"
end
