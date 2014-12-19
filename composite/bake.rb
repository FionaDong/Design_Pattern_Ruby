#bake is leaf
require_relative 'task'

class Bake < Task
  def initialize
    super("Baking the cake.")
  end

  def get_time_required
    15.0
  end
end