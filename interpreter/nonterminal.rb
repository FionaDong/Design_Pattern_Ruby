require_relative 'terminal'
class Or < Expression
  def initialize(expression1, expression2)
    @exp1 = expression1
    @exp2 = expression2
    super()
  end
  def evaluate(dir)
    @result = (@exp1.evaluate(dir) + @exp2.evaluate(dir)).sort.uniq
  end
end

class And < Expression
  def initialize(expression1, expression2)
    @exp1 = expression1
    @exp2 = expression2
    super()
  end
  def evaluate(dir)
    @result = @exp1.evaluate(dir) & @exp2.evaluate(dir)
  end
end

class Not < Expression
  def initialize(expression)
    @exp = expression
    super()
  end
  def evaluate(dir)
    @result = ALL.new.evaluate(dir) - @exp.evaluate(dir)
  end
end

class Expression
  def |(other)
    Or.new(self, other)
  end

  def &(other)
    And.new(self, other)
  end

  def !(other)
    Not.new(other)
  end
end