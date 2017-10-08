class Reader
  attr_accessor :data

  def initialize(file="caso00")
    path =  File.join(File.dirname(__FILE__), "../data/#{file}")
    @data = File.read(path).split("\n")
  end
end