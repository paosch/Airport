require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :weather
  attr_accessor :hangar, :capacity
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise 'Bad weather, landing denied' if weather == :stormy
    raise 'Plane in airport, it cannot land again' unless flying?(plane)
    raise 'Airport full, landing denied' if @hangar.length == @capacity # cannot use the constant because it won't let me change it in the tests later
    @hangar.push(plane)
  end

  def take_off(plane, weather)
    raise 'Bad weather, takeoff denied' if weather == :stormy
    raise 'Plane already flying, it cannot take off' if flying?(plane)
    @hangar.delete(plane)
    @hangar
  end

  def flying?(plane) # plane not in hangar!!
    !@hangar.include?(plane)
  end
end
