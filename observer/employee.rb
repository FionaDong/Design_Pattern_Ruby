#---------------------------
# Subject 
require_relative 'subject'

class Employee
  include Subject
  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(salary)
    @salary = salary
    notify_observers
  end
end

#---------------------------
# Ruby built-in module Observable
# require 'observer'

# class Employee
#   include Observable
#   attr_reader :name, :title, :salary
  
#   def initialize(name, title, salary)
#     super()
#     @name = name
#     @title = title
#     @salary = salary
#   end
#   def salary=(salary)
#     @salary = salary
#     changed
#     notify_observers(self)
#   end
# end

#---------------------------
# block as observer
# require_relative 'subject'
# class Employee
#   include Subject
#   attr_reader :name, :title, :salary

#   def initialize(name, title, salary)
#     super()
#     @name = name
#     @title = title
#     @salary = salary
#   end

#   def salary=(salary)
#     @salary = salary
#     notify_observers
#   end
# end
