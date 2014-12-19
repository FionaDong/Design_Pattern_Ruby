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
end