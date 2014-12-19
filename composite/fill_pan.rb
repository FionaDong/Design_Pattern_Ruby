#fill pan is leaf
require_relative 'task'

class FillPan < Task
  def initialize
    super("Fill in the pan.")
  end

  def get_time_required
    3.0  
  end
end