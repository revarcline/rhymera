require 'clipboard'
require 'tty-prompt'

module Rhymera
  # menu handler
  class Menu
    attr_accessor :list, :result, :word, :function
    attr_reader :prompt

    def initialize
      @prompt = TTY::Prompt.new
      puts 'Welcome to Rhymera.'
    end

    def call
      @word = prompt.ask("Please enter a search term or :q to quit.\n>")
      call if @word == ''
      exit(0) if @word == ':q'
      search(@word)
    end

    def search(term)
      @word = term
      @function = search_type
      @list = Rhymera::List.new(word: @word, function: "get#{@function}s")
      display_results
    end

    def search_type
      prompt.select('Which type of result are you looking for?',
                    %w[Rhyme Portmanteau])
    end

    def display_results
      results = extra_menu_entries
      results << @list.entries.map { |ent| { ent.word.to_s => ent } }
      result = prompt.select("#{@function}s for '#{@word}' and other options:", results)
      @word = result.word
      puts result
    end

    def extra_menu_entries
      [{ "Copy '#{@word}' to Clipboard" => -> { Clipboard.copy(@word) } },
       { "Search '#{@word}'" => -> { search(@word) } },
       { 'New Search' => -> { call } },
       { 'Previous Searches' => 'placeholder for old_list' },
       { 'Quit Program' => -> { exit(0) } }]
    end

    def detail_view; end
  end
end
