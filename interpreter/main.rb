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

# not_bigger_and_rb_file = And.new(Not.new(Bigger.new(1000)),FileName.new('*.rb'))
# puts not_bigger_and_rb_file.evaluate(Dir.getwd)

#syntactic sugaring applied to interpreter

def all
  ALL.new
end

def bigger(size)
  Bigger.new(size)
end

def name(pattern)
  FileName.new(pattern)
end

def writable
  Writable.new
end

def except(expression)
  Not.new(expression)
end

not_big_name = except(bigger(500) & name('*.rb'))
puts not_big_name.evaluate(Dir.getwd)