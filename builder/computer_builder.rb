
class MotherBoard
  attr_accessor :cpu, :memory_size

  def initialize(cpu=BasicCPU.new, memory_size=10000)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type
  attr_reader :size
  attr_reader :writable

  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end

class CPU
end

class BasicCPU < CPU
end

class TurboCPU < CPU
end

class Computer
  attr_reader :display
  attr_reader :motherboard
  attr_reader :drives

  def initialize(display=:crt, motherboard=MotherBoard.new, drives=[])
    @motherboard = motherboard
    @display = display
    @drives = drives
  end
end

class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def turbo(has_turbo_cpu=true)
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    @computer.display = display
  end

  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writer=false)
    @computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer=false)
    @computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end

  def computer
    raise "Not enough memory size." if @computer.motherboard.memory_size < 250
    raise "Too many drives." if @computer.drives.size > 4
    hard_disk = @computer.drives.find {|drive| drive.type == :hard_disk}
    if !hard_disk
      raise "No more room for adding hard disk." if @computer.drives.size > 4
      add_hard_disk(10000)

    end
  end
end

class LaptopBuilder < ComputerBuilder
  
end