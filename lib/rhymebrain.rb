require 'net/http'
require 'json'

# calls Rhymebrain API via URL, gets JSON object
class RhymeBrain
  def self.query(function:, word:)
    uri = URI.parse("https://rhymebrain.com/talk?function=#{function}&word=#{word}")
    JSON.parse(Net::HTTP.get(uri))
  end
end
