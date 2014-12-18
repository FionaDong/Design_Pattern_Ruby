require_relative 'employee'
require_relative 'payroll'

employee = Employee.new "John", "Feb", 200
payroll = PayRoll.new
employee.add_observer(payroll)

#-------------------------------
# block as observer
# employee.add_observer do |changed_employee|
#   puts "#{changed_employee.name}'s salary changed to #{changed_employee.salary}."
# end

employee.salary = 3500
employee.salary = 3600