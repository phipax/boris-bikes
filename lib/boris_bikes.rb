class DockingStation
  attr_reader :var

  def initialize
    @var = Bike.new
    @@bikes_released = Array.new
    @station_free = false
  end

  def release_bike
    @var.working?
    @@bikes_released.push(@var)
    @station_free = true
    return @var
  end

  def dock(bike)
    if @station_free == true && @@bikes_released.include?(bike)
      @@bikes_released.delete(bike)
      @station_free = false
      return "bike docked"
    else
      return "unable to dock bike"
    end
  end

end


class Bike
  def working?
    true
  end
end
