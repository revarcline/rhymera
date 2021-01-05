require 'tty-prompt'
require_relative 'lib/rhymera'
prompt = TTY::Prompt.new
port_list = Rhymera::List.new(function: 'getPortmanteaus', word: 'fancy')

prompt.yes?('is this working?')

prompt.select('Select a result for more info',
              port_list.entries.map(&:word))

prompt.select('Select a result for more info',
              port_list.entries.map { |entry| { entry.word.to_s => entry } })
