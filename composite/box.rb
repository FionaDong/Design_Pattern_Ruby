require_relative 'task'

class Box < Task
  def initialize
    super("boxing the cake.")
  end
  def get_time_required
    2.0
  end
end