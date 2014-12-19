require_relative 'composite_task'

class ManufactureCake < CompositeTask
  # attr_accessor :sub_tasks

  def initialize
    super("manufacturing cake.")
    add_sub_task(MakeCake.new)
    add_sub_task(PackageCake.new)
  end
end