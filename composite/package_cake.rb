require_relative 'composite_task'

class PackageCake < CompositeTask
  def initialize
    super("package the cake for delivery.")
    add_sub_task(Box.new)
    add_sub_task(Label.new)
  end
end