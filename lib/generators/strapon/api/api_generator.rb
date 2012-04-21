module Strapon
  module Generators
    class ApiGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      def run_generation
        puts "Setting up api for class #{class_name.camelize} "

        #models and controllers
        template  "class_api_module.rb"           , "app/models/#{class_name.underscore}/api.rb"
        template  "class_api_controller.rb"       , "app/controllers/api/#{class_name.underscore.pluralize}_controller.rb"
        template  "spec/class_api_spec.rb"        , "spec/api/#{class_name.underscore}_api_spec.rb"

        #views
        template  "apis/show.rabl"                , "app/views/api/#{class_name.underscore.pluralize}/show.rabl"
        template  "apis/update.rabl"              , "app/views/api/#{class_name.underscore.pluralize}/update.rabl"

        inject_into_file "app/models/#{class_name.underscore}.rb", :after => /ActiveRecord::Base/ do
          "\n  include #{class_name.camelize}::API\n"
        end

        # Gemfile
        inject_into_file "Gemfile", :after => /^.*gem 'jquery-rails.*\n/ do
          "\n#api builder support\n"+
          "gem 'rabl'\n"
        end

        # Routes
        inject_into_file "config/routes.rb", :after => /\.routes\.draw do\s*\n/ do
          "  namespace :api do\n    resources :#{class_name.underscore.pluralize},  :only => [:show, :create, :update]\n  end\n\n"
        end
      end

      def after_generate
        puts "*"*80
        puts ""
        puts "remember to run"
        puts "bundle install"
        puts ""
        puts "*"*80
      end
    end
  end
end
