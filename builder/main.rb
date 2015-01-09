require_relative 'computer_builder'
require 'pry'

builder = ComputerBuilder.new

builder.turbo

builder.add_cd(true)

builder.add_dvd

builder.add_hard_disk(10000)
# binding.pry
p builder.computer
#--------------------------------
#polymorphic builder
require_relative 'polymorphic_builder'
laptop_builder = LaptopBuilder.new
laptop_builder.add_cd(true)

p laptop_builder.computer


#--------------------------------
#magic method
require_relative 'magic_method'
laptop_builder = LaptopBuilder.new
laptop_builder.add_cd_and_harddisk(true)

p laptop_builder.computer