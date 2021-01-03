require 'open-uri'
require 'nokogiri'
require 'pry'

class OneLook
  def self.query(search)
    html = URI.parse("https://onelook.com/thesaurus/?s=#{search}").open
    doc = Nokogiri::HTML(html)
    binding.pry
  end
end

# in .thesaurus-content
# get first two td items (40 results)
# iterate through each 'res ressyn'
#
# related to - %3A#{query}
# prefix #{query}*
# suffix with #{query}*

OneLook.query('%3Abird')
