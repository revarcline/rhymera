class Portmanteau
  attr_reader :source_one, :source_two, :word, :alternative

  def initialize(source:, combined:)
    source_words = source.split(',')
    combined_words = combined.split(',')
    @source_one = source_words[0]
    @source_two = source_words[1]
    @word = combined_words[0]
    @alternative = combined_words[1] if combined_words[1]
  end
end
