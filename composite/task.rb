#task is base class for both composite and leaf
class Task
  attr_accessor :name, :parent
  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
  #return basic task number 1 as leaf task
  def total_number_basic_tasks
    1
  end
end