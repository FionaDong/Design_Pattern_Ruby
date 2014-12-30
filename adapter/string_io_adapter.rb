require 'pry'

class StringIOAdapter
  def initialize(str)
    @str = str
    @position = 0
  end

  def getc
    if @position >= @str.size
      raise "EOF Error."
    end

    ch = @str[@position]
    @position += 1
    return ch
  end

  def eof?
    @position >= @str.size
  end

end