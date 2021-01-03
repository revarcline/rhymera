class Portmanteau
  attr_reader :source_one, :source_two, :combined_one, :combined_two

  def initialize(source:, combined:)
    source_words = source.split(',')
    combined_words = combined.split(',')
    @source_one = source_words[0]
    @source_two = source_words[1]
    @combined_one = combined_words[0]
    @combined_two = combined_words[1] if combined[1]
  end
end
