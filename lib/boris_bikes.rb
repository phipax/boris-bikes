class DockingStation
  attr_reader :var

  def initialize
    @var = Bike.new
    #@@bike_created.push(@var)
    @@bikes_released = Array.new
    @station_contains_bike = true
  end

  def release_bike
    if @station_contains_bike == true
      @var.working?
      @@bikes_released.push(@var)
      @station_contains_bike = false
      return @var
    else
      "No bike available"
    end
  end

  def dock(bike)
    if @station_contains_bike == false && @@bikes_released.include?(bike)
      @@bikes_released.delete(bike)
      @station_free = false
      @var = bike
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
