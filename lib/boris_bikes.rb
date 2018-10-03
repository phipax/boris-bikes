class DockingStation

  def initialize
    @max_size = 20
    @bike = Bike.new
    @bikes_in_station = [@bike]
  end

  def release_bike
    raise "No bike available" unless @bikes_in_station.length > 0
    @bikes_in_station.pop
    return @bike
  end

  def dock(bike)
    raise "Unable to dock bike" unless @bikes_in_station.length < @max_size
      @bikes_in_station << @bike
      @bike = bike
      return "Bike docked"
  end

end


class Bike

  def working?
    true
  end

end
