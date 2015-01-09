#builder.add_dvd_and_harddisk

class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def turbo(has_turbo_cpu=true)
    @computer.motherboard.cpu = TurboCPU.new
  end



  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

#Builder Pattern ensure sane object, you could raise any checking error when retrieving the computer.
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
  def initialize(motherboard = MotherBoard.new, drives=[])
    super(:lcd, motherboard, drives)
  end

  def display=(display)
    @computer.display = display
  end  

  def add_cd(writer=false)
    @computer.drives << LaptopDrive.new(:cd, 760, writer)
  end

  def add_dvd(writer=false)
    @computer.drives << LaptopDrive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << LaptopDrive.new(:hard_disk, size_in_mb, true)
  end

  #this is a magic method that takes any method with name like add_dvd_and_harddisk
  def method_missing(name, *args)
    words = name.to_s.split('_')  
    #if the name is not what we expected, just pass it to superclass for any method missing checking.
    return super(name, *args) unless words.shift == 'add'
    words.each do |word|
      next if word == 'and'
      add_cd if word == 'cd'
      add_dvd if word == 'dvd'
      add_hard_disk(100000) if word == 'harddisk'
      turbo if word == 'turbo'
    end
  end

end
