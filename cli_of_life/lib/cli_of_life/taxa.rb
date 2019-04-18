require 'pry'
module CliOfLife::Taxa
  class Taxa
    attr_accessor :taxa_level, :taxa_definition, :taxa_contents
    def initialize(level, definition, contents)
      @taxa_level = level
      @taxa_definition = definition
      @taxa_contents = contents
    end
  end

end
animalia = CliOfLife::Taxa::Taxa.new("Kingdom", "Animals make cholesterol and stuff", ["Mollusca", "Chordata", "Nematoda", "Annelida"])
