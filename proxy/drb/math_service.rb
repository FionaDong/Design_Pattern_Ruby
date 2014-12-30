class MathService
  def add a, b
    a + b
  end
end

require 'drb/drb'

math_service = MathService.new
DRb.start_service("druby://localhost:3000", math_service)
DRb.thread.join