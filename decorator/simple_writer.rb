class SimpleWriter
  def initialize path
    @file = File.open(path, 'a')
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end
#pos is the instance method of IO
  def pos
    @file.pos
  end
#rewind is the instance method of IO
  def rewind
    @file.rewind
  end

  def close
    @file.close
  end

end


