class DockingStation
  attr_reader :var

 def initialize
   @var = Bike.new
   @bikes_released = Array.new
 end

  def release_bike
    @var.working?
    @bikes_released.push(@var)
    return @var
  end

 def dock (bike)
  @bikes_released.include?(bike) ? true : false
 end

end


class Bike
  def working?
    true
  end
end
