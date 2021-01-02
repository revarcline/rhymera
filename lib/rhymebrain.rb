require 'net/http'
require 'json'

# calls Rhymebrain API via URL, gets JSON object
class RhymeBrain
  attr_reader :function, :word, :results

  def initialize(function:, word:)
    @function = function
    @word = word
  end

  def query
    uri = URI.parse("https://rhymebrain.com/talk?function=#{function}&word=#{word}")
    @results = JSON.parse(Net::HTTP.get(uri))
  end
end
