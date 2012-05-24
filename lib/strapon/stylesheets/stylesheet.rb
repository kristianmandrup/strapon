class Stylesheet
  attr_reader :name, :path

  def initialize name, path
    @name, @path = [name, path] 
  end

  def import_path
    File.join path, name
  end
end