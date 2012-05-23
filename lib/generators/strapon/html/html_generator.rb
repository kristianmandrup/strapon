require 'strapon/stylesheets/builder'

module Strapon
  module Generators
    class RiccoGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      class_option :path, :type => :string, :desc => %q{Path to stylesheet_index.yml to be used to copy stylesheets.
Allows finer control of which styles to copy into project}

      def run_generation
        puts "Setting up html controller for class #{class_name.camelize} "

        #models and controllers
        template  "class_controller.rb"             , "app/controllers/#{class_name.underscore.pluralize}_controller.rb"

        #spec
        template  "spec/class_request_spec.rb"      , "spec/requests/campaign/#{class_name.underscore.pluralize}_spec.rb"

        #views
        template  "views/_form.html.haml"           , "app/views/#{class_name.underscore.pluralize}/_form.html.haml"
        template  "views/new.html.haml"             , "app/views/#{class_name.underscore.pluralize}/new.html.haml"

        #css design structure
        remove_file "app/assets/stylesheets/application.css"
        copy_file "stylesheets/application.css.sass", "app/assets/stylesheets/application.css.sass"

        copy_stylesheets options[:path]

        # Gemfile
        inject_into_file "Gemfile", :after => /^.*gem 'jquery-rails.*\n/ do
          "\n#HTML generation and css\n"+
          "gem 'compass', '~> 0.12.alpha.4'\n"+
          "gem 'haml'\n"+
          "gem 'simple_form'\n"+
          "gem 'client_side_validations'\n"
        end

        # Routes
        inject_into_file "config/routes.rb", :after => /\.routes\.draw do\s*\n/ do
          "     resources :#{class_name.underscore.pluralize} \n\n"
        end

      end

      def after_generate

        puts "#{'*'*70}"
        puts ""
        puts "remember to run"
        puts "bundle install"
        puts 'rails g simple_form:install'
        puts 'rails g client_side_validations:install'
        puts "remember to turn off html5 validations in simple_form config otherwise client side validations won't work"
        puts ""
        puts "#{'*'*70}"
      end

      protected

      include Strapon::Stylesheets::Builder
    end
  end
end
