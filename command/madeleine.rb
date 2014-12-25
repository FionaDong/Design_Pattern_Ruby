require 'madeleine'

class Employee
  def initialize name, number, address
    @name = name
    @number = number
    @address = address
  end
  def to_s
    "Employee: name #{@name} num: #{@number} addr: #{address}"
  end
end

class EmployeeManager
  def initialize
    @employees = {}
  end

  def add_employee employee
    @employees[employee.number] = employee
  end

  def delete_employee number
    @employees.remove number
  end

  def change_address number, address
    employee = @employees[number]
    @employees[number].address = address if employee
  end

  def find_employee number
    @employees[number]
  end
end

class AddEmployee
  def initialize employee
    @employee = employee
  end
  def execute system
    system.add_employee(@employee)
  end
end

class DeleteEmpolyee
  def initialize number
    @number = number
  end
  def execute system
    system.delete_employee(number)
  end
end

class FindEmployee
  def initialize number
    @number = number
  end
  def execute system
    system.find_employee(@number)
  end
end

class ChangeAddress
  def initialize number, employee
    @number, @employee = number, employee
  end
  def execute system
    system.change_address @number, @employee
  end
end



store = SnapshotMadeleine.new('employee'){EmployeeManager.new}
Thread.new do 
  sleep 20
  
end
tom = Employee.new('tom','1001','1 Division Street')
harry = Employee.new('harry','1002','3435 Sunnyside Ave')

store.execute_command(AddEmployee.new(tom))
store.execute_command(AddEmployee.new(harry))

puts store.execute_command(FindEmployee.new('1001'))
puts store.execute_command(FindEmployee.new('1002'))

store.execute_command(ChangeAddress.new('1001','Beijing'))

puts store.execute_command(FindEmployee.new('1001'))