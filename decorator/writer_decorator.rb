class WriterDecorator
  
  def initialize real_writer
    @real_writer = real_writer
  end
  def write_line(line)
    @real_writer.write_line(line)
  end
  def pos
    @real_writer.pos
  end

  def rewind
    @real_writer.rewind
  end

  def close
    @real_writer.close
  end
end
# # Below code are simple code for delegation.
# # The def_delegators method will add all of the named methods to your class, and each of those new methods in turn delegates to the object referred to by the attribute. 
require 'forwardable'

class WriterDecorator
  extend Forwardable
  def_delegators :@real_writer, :write_line, :pos, :rewind, :close

  def initialize real_writer
    @real_writer = real_writer
  end
end
#-------------------------------------------
class NumberingWriter < WriterDecorator
  def initialize real_writer
    super
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end

class CheckSummingWriter < WriterDecorator
  attr_reader :check_sum

  def initialize real_writer
    super
    @check_sum = 0
  end

  def write_line(line)
    line.each_byte {|byte| @check_sum = (@check_sum + byte) % 256 }
    @check_sum += "\n".ord % 256
    @real_writer.write_line(line)
  end
end

class TimeStampingWriter < WriterDecorator
  def write_line(line)
    @real_writer.write_line("#{Time.new}: #{line}")
  end
end