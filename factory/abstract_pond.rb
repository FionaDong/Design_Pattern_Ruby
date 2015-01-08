require_relative 'animals'
require_relative 'plants'

class Habitat
  def initialize(number_animals, number_plants, organism_factory)

    @organism_factory = organism_factory

    @animals = []
    number_animals.times do |i|
      @animals << @organism_factory.new_animals("Animals#{i}")
    end

    @plants = []
    number_plants.times do |i|
      @plants << @organism_factory.new_plants("Plants#{i}")
    end
  end

  def simulate_one_day
    @animals.each{|animal| animal.speak}
    @plants.each{|plant| plant.grow}
  end

end

class OrganismFactory
  def initialize(animal_class, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class
  end

  def new_animals(name)
    @animal_class.new(name)
  end

  def new_plants(name)
    @plant_class.new(name)
  end
end


pond_factory = OrganismFactory.new(Frog, WaterLily)
jungle_habitat = Habitat.new(2, 10, pond_factory)
jungle_habitat.simulate_one_day