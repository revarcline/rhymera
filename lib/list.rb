# container for both lists
class List
  attr_reader :query, :type, :object
  attr_accessor :entries

  @all = {}

  class << self
    attr_accessor :all
  end

  def initialize(function:, word:)
    @object = RhymeBrain.query(function: function, word: word)
    @query = word
    @type = function
    @entries = {}
    build_correct_type

    # add to all hash
    self.class.all[@query] = self
  end

  def build_correct_type
    case @type
    when 'getRhymes'
      create_rhymes
    when 'getPortmanteaus'
      create_portmanteaus
    end
  end

  def create_portmanteaus
    @object.each do |entry|
      port = Portmanteau.new(source: entry['source'],
                             combined: entry['combined'])
      entries[port.word] = port
    end
  end

  def create_rhymes
    @object.each do |entry|
      rhyme = Rhyme.new(word: entry['word'],
                        syllables: entry['syllables'])
      entries[rhyme.word] = rhyme
    end
  end
end
