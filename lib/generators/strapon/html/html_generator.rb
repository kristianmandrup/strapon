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
        copy_file "stylesheets/site/00_base/_grid_system.css.sass"          , "app/assets/stylesheets/site/00_base/_grid_system.css.sass"
        copy_file "stylesheets/site/00_base/_variables.css.sass"            , "app/assets/stylesheets/site/00_base/_variables.css.sass"
        copy_file "stylesheets/site/02_typography/_typography.css.sass"     , "app/assets/stylesheets/site/02_typography/_typography.css.sass"
        copy_file "stylesheets/site/03_elements/_elements.css.sass"         , "app/assets/stylesheets/site/03_elements/_elements.css.sass"
        copy_file "stylesheets/site/04_forms/_form_defaults.css.sass"       , "app/assets/stylesheets/site/04_forms/_form_defaults.css.sass"
        copy_file "stylesheets/site/04_forms/_formalize.css.sass"           , "app/assets/stylesheets/site/04_forms/_formalize.css.sass"
        copy_file "stylesheets/site/05_patterns/_buttons.css.scss"          , "app/assets/stylesheets/site/05_patterns/_buttons.css.scss"
        copy_file "stylesheets/site/05_patterns/_navigation.css.sass"       , "app/assets/stylesheets/site/05_patterns/_navigation.css.sass"
        copy_file "stylesheets/site/05_patterns/_rails.css.sass"            , "app/assets/stylesheets/site/05_patterns/_rails.css.sass"
        copy_file "stylesheets/site/06_sprites/_sprites.css.sass"           , "app/assets/stylesheets/site/06_sprites/_sprites.css.sass"
        copy_file "stylesheets/site/07_layout/_layout.css.sass"             , "app/assets/stylesheets/site/07_layout/_layout.css.sass"
        copy_file "stylesheets/site/08_design/_design.css.sass"             , "app/assets/stylesheets/site/08_design/_design.css.sass"
        copy_file "stylesheets/site/09_responsive/_responsive.css.sass"     , "app/assets/stylesheets/site/09_responsive/_responsive.css.sass"
        copy_file "stylesheets/site/10_ie/_ie.css.sass"                     , "app/assets/stylesheets/site/10_ie/_ie.css.sass"
        copy_file "stylesheets/site/11_modernizr/_modernizr.css.sass"       , "app/assets/stylesheets/site/11_modernizr/_modernizr.css.sass"
        copy_file "stylesheets/site/12_print/_print.css.sass"               , "app/assets/stylesheets/site/12_print/_print.css.sass"


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
    end
  end
end
