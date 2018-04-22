require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :weather
  attr_accessor :hangar
  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise 'Landing denied' if @weather.stormy?
    @hangar.push(plane)
  end

  def take_off(plane)
    raise 'Takeoff denied' if @weather.stormy?
    @hangar.delete(plane)
    @hangar
  end
end
