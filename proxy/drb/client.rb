require 'drb/drb'

DRb.start_service
math_service = DRbObject.new_with_uri("druby://localhost:3000")

sum = math_service.add(3,4)
puts sum 