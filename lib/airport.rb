require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :weather
  attr_accessor :hangar, :capacity
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise 'Bad weather, landing denied' if @weather.stormy?
    raise 'Airport full, landing denied' if @hangar.length == CAPACITY
    @hangar.push(plane)
  end

  def take_off(plane)
    raise 'Bad weather, takeoff denied' if @weather.stormy?
    @hangar.delete(plane)
    @hangar
  end
end
