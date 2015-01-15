require_relative 'terminal'
require_relative 'nonterminal'
require 'pry'

# all_files = ALL.new(File.dirname(File.expand_path(__FILE__)))

# bigger_file = Bigger.new(200)
# puts bigger_file.evaluate(Dir.getwd)

# file_name = FileName.new('*.rb')
# puts file_name.evaluate(File.dirname(File.expand_path(__FILE__)))

# writable = Writable.new
# puts writable.evaluate(Dir.getwd)

# not_writable = Not.new(Writable.new)
# puts not_writable.evaluate(File.dirname(__FILE__))

not_bigger_and_rb_file = And.new(Not.new(Bigger.new(1000)),FileName.new('*.rb'))
puts not_bigger_and_rb_file.evaluate(Dir.getwd)
