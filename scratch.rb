require 'cli/ui'
# dumb test idea
class TestObject
  attr_reader :number

  def initialize(number)
    @number = number
  end
end
object_array = []
10.times { |num| object_array << TestObject.new(num) }

CLI::UI::Prompt.ask('what next?', options: (object_array.collect { |obj| obj.number.to_s }))
