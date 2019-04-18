require 'pry'
require 'nokogiri'
module CliOfLife::Taxa
  class Taxa
    attr_accessor :taxa_name, :taxa_level, :taxa_next_down, :taxa_definition, :taxa_contents
    def initialize(name, level, next_down, definition, contents)
      @taxa_name = name
      @taxa_level = level
      @taxa_next_down = next_down
      @taxa_definition = definition
      @taxa_contents = contents
    end
  end

end
