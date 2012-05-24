require 'strapon/stylesheets/stylesheet'

module Strapon
  module Stylesheets
    class FileRepository
      def initialize path = nil
        @path = path unless path.blank?
      end

      def stylesheets
        @stylesheets ||= {}
      end

      def load_stylesheets
        @load_stylesheets ||= Hashie::Mash.new(YAML.load path).stylesheets
      end

      def build
        load_stylesheets.each_pair do |key, value|
          case value
          when String
            add_stylesheet key, "#{value}_#{key}", key
          when Hash
            build_from_hash key, value
          end
        end
        self
      end

      def build_from_hash key, hash
        index = hash[:index]
        raise ArgumentError, "The entry #{key}: is missing index:" unless index
        files = get_files(hash).compact
        raise ArgumentError, "The entry #{key}: is missing file: or files: key" if files.empty?
        files.flatten.each do |file|
          add_stylesheet key, "#{index}_#{file}", file
        end
      end

      def get_files hash
        [hash[:file] || hash[:files]]
      end


      def add_stylesheet key, path, name
        stylesheets[key] ||= []
        stylesheets[key] << StyleSheet.new path, name
      end

      def path
        @path ||= File.dirname(__FILE__) + '/stylesheet_index.yml'
      end
    end
  end
end