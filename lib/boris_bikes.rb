@@register = { bikes: [], #if there's an entry within this array, it means a bike is being used.
stations: []#if there's an entry in this array, it means a station is empty. Not yet coded.
}

class DockingStation

  def initialize
    @bike = Bike.new
    @station_contains_bike = true
  end

  def release_bike
    raise "No bike available" unless @station_contains_bike == true
      @@register[:bikes] << @bike
      @station_contains_bike = false
      return @bike
  end

  def dock(bike)
    raise "Unable to dock bike" unless @station_contains_bike == false && @@register[:bikes].include?(bike)
      @@register[:bikes].delete(bike)
      @station_contains_bike = true
      @bike = bike
      return "Bike docked"
  end

end


class Bike

  def working?
    true
  end

end
