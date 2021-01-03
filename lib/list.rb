# container for both lists
class List
  attr_reader :query, :type, :object
  attr_accessor :entries

  @all = []

  class << self
    attr_accessor :all
  end

  def initialize(function:, word:)
    @object = RhymeBrain.query(function: function, word: word)
    @query = word
    @type = function
    @entries = []
    build_correct_type

    self.class.all << self
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
      entries << Portmanteau.new(source: entry['source'],
                                 combined: entry['combined'])
    end
  end

  def create_rhymes
    @object.each do |entry|
      entries << Rhyme.new(word: entry['word'],
                           syllables: entry['syllables'])
    end
  end
end
