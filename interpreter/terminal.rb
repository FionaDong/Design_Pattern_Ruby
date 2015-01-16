require 'find'
require 'pry'

class Expression
  attr_reader :result
  
  def initialize
    @result =[]
  end

  def evaluate(dir)
  end

end

class ALL < Expression
  def initialize 
    super()
  end

  def evaluate(dir)
    Find.find(dir) do |p|
      next unless File.file?(p)
      @result << p
    end
    @result
  end
end

class Bigger < Expression
  def initialize(size = 100)
    @size = size
    super()
  end
  def evaluate(dir)
    Find.find(dir) do |p|
    next unless File.file?(p)
    @result << p if File.size(p) > @size
    end
    @result
  end
end

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
    super()
  end
  def evaluate(dir)
    Find.find(dir) do |p|
      next unless File.file?(p)
      @result << p if File.fnmatch(@pattern, File.basename(p))
    end
    @result
  end
end

class Writable < Expression
  def evaluate(dir)
    Find.find(dir) do |p|
      next unless File.file?(p)
      @result << p if File.writable?(p)
    end
    @result    
  end
end

