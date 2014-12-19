#composite is for higher level steps
require_relative 'task'

class CompositeTask < Task
  def initialize(name)
    super
    @sub_tasks = []  
  end

  def add_sub_task(task)
    @sub_tasks << task 
    task.parent = self
  end

  def delete_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    @sub_tasks.inject(0.0) do |sum, task|
      sum += task.get_time_required
    end
  end
  #recurrsively get basic task number of composite task.
  def total_number_basic_tasks
    @sub_tasks.inject(0) do |sum, task|
      sum += task.total_number_basic_tasks
    end
  end
end