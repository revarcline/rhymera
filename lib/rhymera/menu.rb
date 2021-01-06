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
      @list = Rhymera::List.new(word: @word, function: "get#{@function}")
      display_results
    end

    def search_type
      prompt.select('Which type of result are you looking for?',
                    %w[Rhymes Portmanteaus])
    end

    def display_results
      results = extra_menu_entries
      results << @list.entries.map { |ent| { ent.word.to_s => ent } }
      result = prompt.select("#{@function} for '#{@word}' and other options:", results)

      @word = result.word
      detail_view(result)
    end

    def extra_menu_entries
      [{ "Copy '#{@word}' to Clipboard" => -> { Clipboard.copy(@word) } },
       { "Search '#{@word}'" => -> { search(@word) } },
       { 'New Search' => -> { call } },
       { 'Previous Searches' => -> { old_searches } },
       { 'Quit Program' => -> { exit(0) } }]
    end

    def detail_view(object)
      menu = extra_menu_entries
      object.instance_variables.each do |var|
        arg = var.to_s.gsub('@', '')
        word = object.send(arg)
        menu << { "#{arg.capitalize}: #{word}" => word }
      end
      opts = prompt.select("More details on #{@word}:", menu)

      @word = opts
      prompt.select("More details on #{@word}:", extra_menu_entries)
    end

    def old_searches
      lists = Rhymera::List.all.map do |list|
        { "#{list.type[3..]} for #{list.query}" => list }
      end
      selection = prompt.select('Previous searches:', lists)
      @list = selection
      @function = selection.type[3..]
      @word = selection.query
      display_results
    end
  end
end
