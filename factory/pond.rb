require_relative 'animals'
require_relative 'plants'
#Factory pattern is similar to Template but creates objects in constructor.
class Pond
  def initialize(number_animals, animal_class, number_plants, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class

    @animals = []
    number_animals.times do |i|
      @animals << new_organism(:animal, "Animal#{i}")
    end
    @plants = []
    number_plants.times do |i|
      @plants << new_organism(:plant, "Plant#{i}")
    end
  end
  def simulate_one_day
    @animals.each{|animal| animal.speak}
    @plants.each{|plant| plant.grow}
  end
  def new_organism(type, name)
    case type
    when :animal
      @animal_class.new(name)
    when :plant
      @plant_class.new(name)
    end
  end  
end
