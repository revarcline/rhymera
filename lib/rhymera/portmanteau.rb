module Rhymera
  # converts RhymeBrain json data to object
  class Portmanteau
    attr_reader :prefix, :suffix, :word, :alternative

    def initialize(source:, combined:)
      source_words = source.split(',')
      combined_words = combined.split(',')
      @prefix = source_words[0]
      @suffix = source_words[1]
      @word = combined_words[0]
      @alternative = combined_words[1] if combined_words[1]
    end
  end
end
