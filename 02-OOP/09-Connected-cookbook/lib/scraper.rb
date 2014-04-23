require 'nokogiri'
require 'open-uri'



class Scraper

  attr_reader(:doc)

  def initialize(url)
    @url = url
    @html_file = open(url)
    @doc = Nokogiri::HTML(@html_file)
  end
end

class ScraperMarmiton < Scraper

  def initialize(ingredient)
    url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}"
    super(url)
    @ingredient = ingredient
  end
end


# beans_scraper = ScraperMarmiton.new('haricots')

# # p beans_scraper

# beans_scraper.doc.search('.m_search_result').each do |element|
#       puts "#{element.search('.m_search_titre_recette > a').inner_text}"
#       puts "Rating : #{element.search('.etoile1').size} / 5}"
#   end