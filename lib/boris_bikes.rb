
class DockingStation
  attr_reader :bike
  @@bikes_released = Array.new

  def initialize
    @bike = ''
    @station_contains_bike = true
  end

  def release_bike
    @bike = Bike.new
    if @station_contains_bike == true
      @bike.working?
      @@bikes_released.push(@bike)
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
    end
  end
end

class Bike
  def working?
    true
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
