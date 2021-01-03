class Rhyme
  attr_reader :word, :syllables

  def initialize(word:, syllables:)
    @word = word
    @syllables = syllables
  end
end
