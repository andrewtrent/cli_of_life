module CliOfLife::Scraper
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  def self.scrape_animal
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Animal"))
    @contents = []
    doc.css(".wikitable td b").each {|ph| @contents << ph.text}
    @name = doc.css(".biota b").text
    @definition = doc.css("p").text.strip.split("\n")[0]
    @level = doc.at(".biota tr:contains('#{@name}')").css('td').first.text.strip.gsub(":","")
    #binding.pry
    CliOfLife::Taxa::Taxa.new(@name, @level, "Phyla", @definition, @contents)
  end


end
