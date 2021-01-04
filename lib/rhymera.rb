# frozen_string_literal: true

require_relative 'rhymera/version'

module Rhymera
  class Error < StandardError; end
  run = Menu.new
  run.new_word
end
