require 'strapon/stylesheets/stylesheet'

class FileRepository
  # TODO: Should load css files from stylesheets.yml
  attr_reader :stylesheets

  def initialize path = nil
    @path = path unless path.blank?
  end

  def load_stylesheets
    @load_stylesheets ||= Hashie::Mash.new(YAML.load path).stylesheets
  end

  def build
    load_stylesheets.each_pair do |key, value|
      case value
      when String
        add_stylesheet "#{value}_#{key}", key
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
      add_stylesheet "#{index}_#{file}", file
    end
  end

  def get_files hash
    [hash[:file] || hash[:files]]
  end


  def add_stylesheet path, name
    stylesheets << StyleSheet.new path, name
  end

  def path
    @path ||= File.dirname(__FILE__) + '/stylesheet_index.yml'
  end
end