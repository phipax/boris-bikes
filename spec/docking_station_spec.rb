require "boris_bikes"

describe DockingStation do

  before(:each) do
    @docking_station = DockingStation.new
    #@bike = Bike.new
  end

  it "should create an object for DockingStation" do
    expect(DockingStation.new(40)).to be_a(DockingStation)
  end

  it "should create an object for DockingStation with capacity of 80" do
    expect(DockingStation.new(80).sizeofthisstation).to eq(80)
  end

  it { is_expected.to respond_to(:release_bike) }
#  it { is_expected.to respond_to(:empty?) }
#  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:dock_defective_bike) }

  it "Release bike creating an instance of Bike Class" do
    expect(@docking_station.release_bike).to be_a(Bike)
  end

  it "Returns true from Working? method" do
    expect(@docking_station.release_bike.working?).to eq(true)
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "Calling dock bike when the station is not free returns warning" do
    ((DockingStation::MAXSIZE)-1).times do
      @docking_station.dock(double(:bike))
    end
    expect{@docking_station.dock(double(:bike))}.to raise_error("Station full: Unable to dock bike")
  end

  it "Releasing bike from empty station returns warning" do
    @docking_station.release_bike
    expect{@docking_station.release_bike}.to raise_error("No bike available")
  end

  it "Calling dock bike when the station is free returns success message" do
    bike1 = @docking_station.release_bike
    expect(@docking_station.dock(bike1)).to eq "Bike docked"
  end

  it "Shows condition as defective when returning defective bike" do
    @docking_station.dock_defective_bike(double(:bike))
    expect(double(:bike).working?).to eq(false)
  end

end
