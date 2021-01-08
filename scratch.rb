require 'tty-prompt'
require_relative 'lib/rhymera'
prompt = TTY::Prompt.new
port_list = Rhymera::List.new(function: 'getPortmanteaus', word: 'fancy')

prompt.yes?('is this working?')

prompt.select('Select a result for more info',
              port_list.entries.map(&:word))

object = prompt.select('Select a result for more info',
                       port_list.entries.map { |entry| { entry.word.to_s => entry } })

object.instance_variables

object.instance_variables.first.to_s.gsub('@', '')

object.source_one

object.instance_variables.each do |var|
  arg = var.to_s.gsub('@', '')
  puts "#{arg.capitalize}: #{object.send(arg)}"
end

Rhymera::List.all

Rhymera::List.all.first.class.to_s.split('::')[1]
Rhymera::List.all.first.entries.first.word

Rhymera::List.all.first.query
Rhymera::List.all.first.type[3..]

 curl -u revarcline https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
