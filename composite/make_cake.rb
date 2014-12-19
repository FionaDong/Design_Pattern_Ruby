# make cake is higher level steps which made up of bake and fill pan.
require_relative 'composite_task'

class MakeCake < CompositeTask
  attr_accessor :sub_tasks

  def initialize
    super("making cake")
    add_sub_task(FillPan.new)
    add_sub_task(Bake.new)
  end
end