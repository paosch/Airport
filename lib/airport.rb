require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    raise 'Takeoff denied' if @weather.stormy?
    @hangar.delete(plane)
    @hangar
  end
end
