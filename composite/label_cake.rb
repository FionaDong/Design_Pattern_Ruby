require_relative 'task'

class Label < Task
  def initialize
    super("put label on the box.")
  end
  def get_time_required
    0.5
  end
end