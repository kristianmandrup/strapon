class Stylesheet
  attr_reader :name, :path

  def initialize name, path
    @name, @path = [name, path] 
  end
end