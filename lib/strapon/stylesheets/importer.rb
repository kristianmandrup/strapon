module Strapon
  module Stylesheets
    # Use in  application.css.sass.erb
    # <%= Strapon::Stylesheets::Importer.import_styles %>
    class Importer
      def initialize path = nil
        @path = path unless path.blank?
      end

      def import_styles
        folder_index.map do |folder|
          import_statements folder
        end.join("\n")
      end

      protected

      def import_statements folder
        stylesheets[folder].map do |stylesheet|
          "@import #{stylesheet.import_path}"
        end.join("\n")
      end

      def folder_index
        Yaml.load(path)['index']
      end

      def path
        @path ||= Rails.root.join 'app/assets/stylesheets/', 'index.yml'
      end

      def stylesheets
        @stylesheets ||= FileRepository.new.build.stylesheets
      end
    end
  end
end
