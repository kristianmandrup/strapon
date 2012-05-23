require 'generators/strapon/html/file_repository'

module Strapon
  module Generators
    class RiccoGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

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
        copy_file "stylesheets/application.css.sass"                        , "app/assets/stylesheets/application.css.sass"

        copy_stylesheets

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

      def copy_stylesheets
        FileRepository.new.build.stylesheets.each do |stylesheet|
          copy_stylesheet stylesheet.path, stylesheet.name
        end
      end

      def copy_stylesheet path, name
        copy_file stylesheet_path(:src, path), stylesheet_path(:target, path)
      end

      def stylesheet_path type, path
        File.join send("#{type}_stylesheet_dir"), path, "_#{name}.#{stylesheet_ext}"
      end

      def stylesheet_ext
        'css.sass'
      end

      def src_stylesheet_dir
        'stylesheets/site/'
      end

      def target_stylesheet_dir
        File.join "app/assets/", stylesheet_src_dir
      end
    end
  end
end
