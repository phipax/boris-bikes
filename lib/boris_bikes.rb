@@register = { bikes: [], #if there's an entry within this array, it means a bike is being used.
stations: []#if there's an entry in this array, it means a station is empty. Not yet coded.
}

class DockingStation
  attr_reader :var

  def initialize
    @bike = Bike.new
    @station_contains_bike = true
  end

  def release_bike
    if @station_contains_bike == true
      @@register[:bikes] << @bike
      @station_contains_bike = false
      return @bike
    else
      "No bike available"
    end
  end

  def dock(bike)
    if @station_contains_bike == false && @@register[:bikes].include?(bike)
      @@register[:bikes].delete(bike)
      @station_contains_bike = true
      @bike = bike
      return "Bike docked"
    else
      return "Unable to dock bike"
    end
  end

end


class Bike
  def working?
    true
  end
end
