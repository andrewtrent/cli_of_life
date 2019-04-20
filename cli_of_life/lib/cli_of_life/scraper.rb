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
    CliOfLife::Taxa::Taxa.new(@name, @level, "phyla", @definition, @contents)
  end

  def self.scrape_phylum(name)
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{name}"))
    @contents = []
    subclassp = doc.at('.biota p:contains("Class")')
    ahrefs = subclassp.css('a')#.text.split(" ").each {|cl| @contents << cl.text}
    splitsies = subclassp.text.split("\n")
    subbed = splitsies.map {|s| s.gsub("Class", "")}
    firstword = subbed.map {|s| s.split(" ")[0].strip.gsub("&nbsp;", "")}
    firstword.each {|fw| @contents << fw}
    @name = doc.css(".biota b").text
    @definition = doc.css("p:contains('the')").text.split("\n")[0]
    @level = "Phylum"
    CliOfLife::Taxa::Taxa.new(@name, @level, "classes", @definition, @contents)
  end

  def self.scrape_klass(name)
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{name}"))
    @contents = []
    doc.css(".section-content").text.split("\n").each {|cn| @contents << cn unless cn == ""}


    @name = doc.css(".biota b").text
    @definition = doc.css("p:contains('the')").text.split("\n")[0]
    @level = "Phylum"
    CliOfLife::Taxa::Taxa.new(@name, @level, "groups", @definition, @contents)
  end


end
