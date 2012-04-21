module Strapon
  module Generators
    class RiccoGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

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

        copy_file "stylesheets/site/00_variables/_all.sass"             , "app/assets/stylesheets/site/00_variables/_all.sass"
        copy_file "stylesheets/site/00_variables/_base.sass"            , "app/assets/stylesheets/site/00_variables/_base.sass"
        copy_file "stylesheets/site/00_variables/_colors.sass"          , "app/assets/stylesheets/site/00_variables/_colors.sass"
        copy_file "stylesheets/site/00_variables/_fonts.sass"           , "app/assets/stylesheets/site/00_variables/_fonts.sass"
        copy_file "stylesheets/site/00_variables/_grid.sass"            , "app/assets/stylesheets/site/00_variables/_grid.sass"

        copy_file "stylesheets/site/01_reset/_reset.sass"               , "app/assets/stylesheets/site/01_reset/_reset.sass"

        copy_file "stylesheets/site/02_grid/_grid_system.sass"          , "app/assets/stylesheets/site/02_grid/_grid_system.sass"
        copy_file "stylesheets/site/02_grid/_grids_blueprint.sass"      , "app/assets/stylesheets/site/02_grid/_grids_blueprint.sass"

        copy_file "stylesheets/site/03_typography/_typography.sass"     , "app/assets/stylesheets/site/03_typography/_typography.sass"

        copy_file "stylesheets/site/04_elements/_all.sass"                          , "app/assets/stylesheets/site/04_elements/_all.sass"
        copy_file "stylesheets/site/04_elements/_common.sass"                       , "app/assets/stylesheets/site/04_elements/_common.sass"
        copy_file "stylesheets/site/04_elements/_edits.sass"                        , "app/assets/stylesheets/site/04_elements/_edits.sass"
        copy_file "stylesheets/site/04_elements/_headers.sass"                      , "app/assets/stylesheets/site/04_elements/_headers.sass"
        copy_file "stylesheets/site/04_elements/_images.sass"                       , "app/assets/stylesheets/site/04_elements/_images.sass"
        copy_file "stylesheets/site/04_elements/_lists.sass"                        , "app/assets/stylesheets/site/04_elements/_lists.sass"
        copy_file "stylesheets/site/04_elements/_semantics.sass"                    , "app/assets/stylesheets/site/04_elements/_semantics.sass"
        copy_file "stylesheets/site/04_elements/_tables.sass"                       , "app/assets/stylesheets/site/04_elements/_tables.sass"

        copy_file "stylesheets/site/05_forms/_all.sass"                             , "app/assets/stylesheets/site/05_forms/_all.sass"
        copy_file "stylesheets/site/05_forms/_dropdowns.sass"                       , "app/assets/stylesheets/site/05_forms/_dropdowns.sass"
        copy_file "stylesheets/site/05_forms/_fancy_dropdown.css.scss"              , "app/assets/stylesheets/site/05_forms/_fancy_dropdown.css.scss"
        copy_file "stylesheets/site/05_forms/_form_defaults.css.sass"               , "app/assets/stylesheets/site/05_forms/_form_defaults.css.sass"
        copy_file "stylesheets/site/05_forms/_formalize.css.sass"                   , "app/assets/stylesheets/site/05_forms/_formalize.css.sass"
        copy_file "stylesheets/site/05_forms/_form_layouts.sass"                    , "app/assets/stylesheets/site/05_forms/_form_layouts.sass"

        copy_file "stylesheets/site/06_patterns/_all.sass"                          , "app/assets/stylesheets/site/06_patterns/_all.sass"
        copy_file "stylesheets/site/06_patterns/_button_groups.sass"                , "app/assets/stylesheets/site/06_patterns/_button_groups.sass"
        copy_file "stylesheets/site/06_patterns/_buttons.sass"                      , "app/assets/stylesheets/site/06_patterns/_buttons.sass"
        copy_file "stylesheets/site/06_patterns/_close.sass"                        , "app/assets/stylesheets/site/06_patterns/_close.sass"
        copy_file "stylesheets/site/06_patterns/_component_animations.sass"         , "app/assets/stylesheets/site/06_patterns/_component_animations.sass"
        copy_file "stylesheets/site/06_patterns/_popovers.sass"                     , "app/assets/stylesheets/site/06_patterns/_popovers.sass"
        copy_file "stylesheets/site/06_patterns/_rails_messages.sass"               , "app/assets/stylesheets/site/06_patterns/_rails_messages.sass"
        copy_file "stylesheets/site/06_patterns/_wells.sass"                        , "app/assets/stylesheets/site/06_patterns/_wells.sass"

        copy_file "stylesheets/site/07_navigation/_navigation.sass"                 , "app/assets/stylesheets/site/07_navigation/_navigation.sass"

        copy_file "stylesheets/site/08_sprites/_sprites.css.sass"                   , "app/assets/stylesheets/site/08_sprites/_sprites.css.sass"

        copy_file "stylesheets/site/09_plugins/_plugins.css.sass"                   , "app/assets/stylesheets/site/09_plugins/_plugins.css.sass"

        copy_file "stylesheets/site/10_layout_design/_all.sass"                     , "app/assets/stylesheets/site/10_layout_design/_all.sass"
        copy_file "stylesheets/site/10_layout_design/_layout.sass"                  , "app/assets/stylesheets/site/10_layout_design/_layout.sass"
        copy_file "stylesheets/site/10_layout_design/_design.sass"                  , "app/assets/stylesheets/site/10_layout_design/_design.sass"

        copy_file "stylesheets/site/11_styletile/_tile_design.sass"                 , "app/assets/stylesheets/site/11_styletile/_tile_design.sass"
        copy_file "stylesheets/site/11_styletile/_tile_layout.sass"                 , "app/assets/stylesheets/site/11_styletile/_tile_layout.sass"
        copy_file "stylesheets/site/11_styletile/_tile_responsive.sass"             , "app/assets/stylesheets/site/11_styletile/_tile_responsive.sass"

        copy_file "stylesheets/site/12_responsive/_bootstrap.css.scss"              , "app/assets/stylesheets/site/12_responsive/_bootstrap.css.scss"
        copy_file "stylesheets/site/12_responsive/_mixins.sass"                     , "app/assets/stylesheets/site/12_responsive/_mixins.sass"
        copy_file "stylesheets/site/12_responsive/_blueprint.sass"                  , "app/assets/stylesheets/site/12_responsive/_blueprint.sass"

        copy_file "stylesheets/site/13_browser_adjustments/_ie.css.sass"            , "app/assets/stylesheets/site/13_browser_adjustments/_ie.css.sass"
        copy_file "stylesheets/site/13_browser_adjustments/_modernizr.css.sass"     , "app/assets/stylesheets/site/13_browser_adjustments/_modernizr.css.sass"
        copy_file "stylesheets/site/13_browser_adjustments/_selectivizr.sass"        , "app/assets/stylesheets/site/13_browser_adjustments/_selectivizr.sass"

        copy_file "stylesheets/site/14_print/_print.css.sass"                       , "app/assets/stylesheets/site/14_print/_print.css.sass"

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
    end
  end
end
