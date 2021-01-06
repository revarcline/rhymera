module Rhymera
  # container for lists of Rhyme and Portmanteau
  class List
    attr_reader :query, :type, :object
    attr_accessor :entries

    @all = []

    # using class instance variable instead of class variable per rubocop
    class << self
      attr_accessor :all
    end

    def initialize(function:, word:)
      @object = Rhymera::RhymeBrain.query(function: function, word: word)
      @query = word
      @type = function
      @entries = []
      build_correct_type

      # add to all hash
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
        port = Rhymera::Portmanteau.new(source: entry['source'],
                                        combined: entry['combined'])
        entries << port
      end
    end

    def create_rhymes
      @object.each do |entry|
        rhyme = Rhymera::Rhyme.new(word: entry['word'],
                                   syllables: entry['syllables'])
        entries << rhyme
      end
    end
  end
end
