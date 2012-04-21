require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # Configure Rails Envinronment
  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../dummy/config/environment.rb",  __FILE__)

  require 'rspec/rails'
  #require 'factory_girl'
  #require 'database_cleaner'

  ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

  RSpec.configure do |config|

    config.mock_with :rspec
    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
  end  
end

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Spork.each_run do
  DatabaseCleaner.clean
end

