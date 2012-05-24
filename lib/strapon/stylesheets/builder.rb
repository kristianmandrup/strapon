require 'strapon/file_repository'

module Strapon
  module Stylesheets
    module Builder
      def copy_stylesheets
        FileRepository.new.build.stylesheets.each_pair do |folder, stylesheet|
          copy_stylesheet stylesheet
        end
      end

      def copy_stylesheet stylesheet
        copy_file stylesheet_path(:src, stylesheet), stylesheet_path(:target, stylesheet)
      end

      def stylesheet_path type, stylesheet
        File.join send("#{type}_stylesheet_dir"), stylesheet.path, "_#{stylesheet.name}.#{stylesheet_ext}"
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