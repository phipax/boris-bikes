
class DockingStation
  attr_reader :bike
  @@bikes_released = Array.new
  BIKECOUNT = 20

  def initialize
    @bike = []
    @station_contains_bike = true
  end

  def release_bike
    @bike.push(Bike.new) if(@bike.count == 0 || @bike.count <= BIKECOUNT) 
    if @station_contains_bike == true
      @bike[0].working?
      @@bikes_released.push(@bike[])
      #puts @@bikes_released
      @station_contains_bike = false
      @bike
    else
     raise "No bike available"
    end
  end

  def dock(bike)
  #  puts "#{@station_contains_bike} #{@@bikes_released}"
    if @station_contains_bike == false && @@bikes_released.include?(bike)
      @@bikes_released.delete(bike)
      @station_contains_bike = true
      @bike = bike
      "Bike docked"
    else
      raise "Unable to dock more bikes"
=======
  MAXSIZE= 20
  attr_accessor :size_of_station
  def initialize (max = MAXSIZE)
    @size_of_station = max
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
    raise "Station full: Unable to dock bike" if full?
    @bikes_in_station << bike
    return "Bike docked"
  end

  def dock_defective_bike(bike)
    raise "Station full: Unable to dock bike" if full?
    bike.condition_to_defective
    @bikes_in_station << bike
    return "Defective bike docked"
  end

  def full?
    @bikes_in_station.length == @size_of_station
  end

  def empty?
    if @bikes_in_station.length == 0
      return true
    else
      @bikes_in_station.each do |bike|
        if bike.working?
          return false
        end
      end

    end
    return true
  end


  private :full?, :empty?

end

class Bike

  def initialize
    @bike_condition = true
  end

  def working?
    return @bike_condition
  end

  def condition_to_defective
    @bike_condition = false
  end
end

# old code
=begin
attr_reader :var
@@bikes_released = Array.new

def initialize
  @var = Bike.new
  @station_contains_bike = true
end

def release_bike
  Bike.new
  if @station_contains_bike == true
    @var.working?
    @@bikes_released.push(@var)
    #puts @@bikes_released
    @station_contains_bike = false
    return @var
    @var
  else
    "No bike available"
  end
end

def dock(bike)
  #puts "#{@station_contains_bike} #{@@bikes_released}"
  if @station_contains_bike == false && @@bikes_released.include?(bike)
    @@bikes_released.delete(bike)
    @station_contains_bike = true
    @var = bike
    "Bike docked"
  else
    "Unable to dock bike"
  end
end
=end


class Van
  def fetch_broken_bikes(dockingstation)
    1
  end
end

class Garage
end

