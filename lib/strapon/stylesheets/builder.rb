require 'strapon/file_repository'

module Strapon
  module StylesheetsBuilder
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