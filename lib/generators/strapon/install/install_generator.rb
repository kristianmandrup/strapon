module Strapon
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def run_generation
        append_file 'Rakefile', "\nrequire 'strapon/tasks'"


        rake 'strapon:install:migrations'

        copy_file 'application.html.haml'                     , 'app/views/layouts/application.html.haml'
        remove_file 'app/views/layouts/application.html.erb'

        #set up specs
        copy_file "spec/spec_helper.rb"                       , "spec/spec_helper.rb"
        copy_file 'spec/support/capybara.rb'                  , 'spec/support/capybara.rb'
        copy_file 'spec/support/capybara_ext.rb'              , 'spec/support/capybara_ext.rb'
        copy_file 'spec/support/routes.rb'                    , 'spec/support/routes.rb'
        copy_file 'spec/support/sign_in_helpers.rb'           , 'spec/support/sign_in_helpers.rb'
        copy_file 'spec/support/factories/admins.rb'          , 'spec/support/factories/admins.rb'
        copy_file 'spec/requests/admin_sign_in_spec.rb'       , 'spec/requests/admin_sign_in_spec.rb'
        copy_file 'spec/requests/admin_sign_out_spec.rb'      , 'spec/requests/admin_sign_out_spec.rb'
        copy_file 'spec/requests/admins_spec.rb'              , 'spec/requests/admins_spec.rb'
        copy_file 'spec/routing/routing_spec.rb'              , 'spec/routing/routing_spec.rb'

        copy_file 'Guardfile'                                 , 'Guardfile'

        create_file  '.rspec', '--colour'

        # Gemfile
        inject_into_file "Gemfile", :after => /^.*gem ['"]jquery-rails['"]/ do
          "\n\n#:development gems\n"+
          "gem 'haml-rails', '>= 0.3.4', :group => :development\n"+
          "gem 'powder', :group => :development\n"+
          "gem 'guard', '>= 0.10.0', :group => :development\n"+
          "gem 'guard-bundler', :group => :development\n"+
          "gem 'guard-rails', '>= 0.0.3', :group => :development\n"+
          "gem 'guard-livereload', '~> 0.4.2', :group => :development\n"+
          "gem 'guard-compass', :group => :development\n"+
          "gem 'annotate', :group => :development\n"+
          "gem 'rails-footnotes', '>= 3.7', :group => :development\n"+
          "gem 'cheat', '~> 1.3.0', :group => :development\n"+
          "gem 'hirb-unicode', :group => :development\n"+
          "gem 'pry-rails', :group => :development\n"+
          "#guard dependencies on mac\n"+
          "gem 'rb-fsevent', :group => :development\n"+
          "gem 'growl', :group => :development\n\n"+
          "#:development and :test gems\n"+
          "gem 'rspec-rails', '>= 2.8.0', :group => [:development, :test]\n"+
          "gem 'awesome_print', :group => [:development, :test]\n"+
          "gem 'ruby-debug19', :group => [:development, :test]\n"+
          "gem 'jasmine', :group => [:development, :test]\n"+
          "gem 'jasminerice', :group => [:development, :test]\n"+
          "gem 'guard-rspec', :group => [:development, :test]\n"+
          "#:test gems\n"+
          "gem 'turn', :require => false, :group => :test\n"+
          "gem 'capybara', '>= 1.1.0', :group => :test\n"+
          "gem 'selenium-webdriver', '~> 2.10.0', :group => :test\n"+
          "gem 'cucumber-rails', '~> 1.0.2', :group => :test\n"+
          "gem 'launchy', :group => :test\n"+
          "gem 'factory_girl_rails', :group => :test\n"+
          "gem 'database_cleaner', :group => :test\n"+
          "gem 'rack-test', '>= 0.5.7', :group => :test\n"+
          "gem 'bourne', :group => :test\n"+
          "gem 'nokogiri', :group => :test\n"+
          "gem 'shoulda', :group => :test\n"+
          "gem 'spork', :group => :test\n"+
          "gem 'guard-spork', :group => :test\n"+
          "#gem 'fuubar', :group => :test\n"+
          "#gem 'webmock', :group => :test\n"
        end

        #inject_into_file "config/routes.rb", :after => /\.routes\.draw do\s*\n/ do
        #    "#Starting routes\n"
        #end

        #remove index file
        remove_file 'public/index.html'

      end

      def after_generate
        puts "#{'*'*70}"
        puts "Please run the following commands"
        puts "bundle install"
        puts "rake db:create"
        puts "rake db:migrate"
        puts "rake db:test:prepare"
        puts "rails g rails_footnotes:install"
        puts "#{'*'*70}"
      end
    end
  end
end

