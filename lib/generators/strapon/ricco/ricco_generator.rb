require 'strapon/stylesheets/builder'

module Strapon
  module Generators
    class RiccoGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      class_option :path, :type => :string, :desc => %q{Path to stylesheet_index.yml to be used to copy stylesheets.
Allows finer control of which styles to copy into project}

      def run_generation
        puts "Setting up Ricco to do the damage"

        #html helpers
        copy_file 'application_helper.rb'                               , 'app/helpers/application_helper.rb'
        copy_file 'application.html.haml'                               , 'app/views/layouts/application.html.haml'
        copy_file 'empty.html.haml'                                     , 'app/views/layouts/empty.html.haml'
        copy_file '_navigation.html.haml'                               , 'app/views/layouts/_navigation.html.haml'

        remove_file 'application.html.erb'

        #css design structure
        remove_file "app/assets/stylesheets/application.css"

        copy_file "stylesheets/application.css.sass"                    , "app/assets/stylesheets/application.css.sass"

        copy_stylesheets options[:path]

        # Gemfile
        inject_into_file "Gemfile", :after => /^.*gem 'jquery-rails.*\n/ do
          "\n#HTML generation and css\n"+
          "gem 'high_voltage'\n"+
          "gem 'haml'\n"+
          "gem 'simple_form'\n"+
          "gem 'client_side_validations'\n"
        end

        inject_into_file "Gemfile", :after => /^.*group :assets do*\n/ do
          "  gem 'compass-rails'\n"+
          "  gem 'bootstrap-sass'\n"
        end


      end

      def after_generate

        puts "#{'*'*70}"
        puts ""
        puts "remember to run"
        puts "bundle install"
        puts 'rails g simple_form:install'
        puts 'rails g client_side_validations:install'
        puts ""
        puts "turn off html5 validations in simple_form config otherwise client side validations won't work"
        puts ""
        puts "#{'*'*70}"
      end

      protected

      include Strapon::Stylesheets::Builder
    end
  end
end
