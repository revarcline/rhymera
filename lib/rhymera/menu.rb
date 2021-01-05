require 'clipboard'
require 'tty-prompt'

module Rhymera
  # menu handler
  class Menu
    attr_accessor :list
    attr_reader :prompt

    def initialize
      @prompt = TTY::Prompt.new
    end

    def call
      puts 'howdy'
    end

    def search_type
      prompt_select('Which type of result are you looking for?',
                    { 'Rhyme' => 'getRhymes', 'Portmanteau' => 'getPortmanteau' })
    end

    def display_results
      prompt.select('Select a result for more info:',
                    @list.entries.map { |ent| { ent.word.to_s => entry } })
    end
  end
end
