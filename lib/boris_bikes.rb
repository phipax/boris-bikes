class DockingStation
  MAXSIZE= 20
  attr_accessor :sizeofthisstation
  def initialize (max = MAXSIZE)
    @sizeofthisstation = max
    @bike = Bike.new
    @bikes_in_station = [@bike]
  end

  def release_bike
    #raise "No bike available" unless @bikes_in_station.length > 0
    raise "No bike available" if empty?
    @bikes_in_station.pop
    return @bike
  end

  def dock(bike)
    #raise "Unable to dock bike" unless @bikes_in_station.length < @max_size
    raise "Unable to dock bike" if full?
    @bikes_in_station << @bike
    return "Bike docked"
  end

  def full?
    if @bikes_in_station.length == @sizeofthisstation
      return true
    else
      return false
    end
  end

  def empty?
    if @bikes_in_station.length == 0
      return true
    else
      return false
    end
  end

  private :full?, :empty?

end


class Bike

  def working?
    true
  end

end
