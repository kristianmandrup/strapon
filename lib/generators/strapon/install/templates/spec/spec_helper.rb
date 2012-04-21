require 'rubygems'
#issue with spork loading FactoryGirl needs to be resolved
#require 'spork'

#Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'factory_girl'
  require 'database_cleaner'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    #this is also set in the intializer, it makes passwords less secure but faster to create in test environment
    Devise.stretches = 1
    # won't log everuthing so needs to be uncommented to investigate a failing test
    Rails.logger.level = 4
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    # TODO find out what this is about...?
    config.infer_base_class_for_anonymous_controllers = false

    #TODO some config option from railscasts epispode 285, that might be useful down the track
    #config.include(MailerMacros#)
    #config.before(:each) { reset_email }
    #config.treat_symbols_as_metadata_keys_with_true_values = true
    #config.filter_run :focus => true
    #config.run_all_when_everything_filtered = true
  end

#end

#Spork.each_run do
  # This code will be run each time you run your specs.
#  FactoryGirl.reload
#end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading
#   code that you don't normally modify during development in the
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
