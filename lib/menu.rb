require 'cli/ui'
require 'clipboard'

# menu handler
class Menu
  attr_accessor :query, :type, :list, :result

  def new_word
    @query = prompt.ask('Enter your RhymeBrain query:')
    type = prompt.ask('Which type of results do you want?',
                      options: %w[Rhyme Portmanteau])
    @type = "get#{type}s"
    @list = List.new(function: @type, word: @query)
    select_result
  end

  def prompt
    CLI::UI::Prompt
  end

  def new_list; end

  def old_list; end

  def select_result
    selected = prompt.ask('Select a result:', options: @list.entries.keys)
    @result = detail_view(@list.entries[selected])
  end

  def detail_view(_object)
    new_word = prompt.ask('Entry details (select term for more options)',
                          options: {})
    work_with(new_word)
  end

  def work_with(string)
    option = prompt.ask("You have selected #{string}",
                        options: ['Copy to clipboard',
                                  'Search this term',
                                  'Search new term',
                                  'See previous searches'])
    case option
    when /clipboard/
      Clipboard
    when /this/
      # new search with term
    when /new/
      new_word
    when /previous/
      previous_queries
    end
  end

  def previous_queries
    prompt.ask('Please select from previous queries:',
               options: List.all.keys)
  end
end
