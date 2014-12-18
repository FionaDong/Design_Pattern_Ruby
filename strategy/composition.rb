class Car
  def initialize
    @engine = GasolineEngine.new
  end

  def saturday_drive
    @engine.start
    @engine.stop
  end

  def switch_to_diesel
    @engine = DieselEngine.new
  end
end