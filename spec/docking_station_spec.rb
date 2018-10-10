require "boris_bikes"


  describe DockingStation do
    before(:each) do
     @docking_station = DockingStation.new
     @bike = Bike.new
    end

    it "should create an object for DockingStation" do
      expect(DockingStation.new).to be_a(DockingStation)
    end
# ----- testing DockingStation instances --------------------------------

# Test for checking Release_bike and working?
    it { is_expected.to respond_to(:release_bike) }

    it "Release bike creating an instance of Bike Class" do
      expect(@docking_station.release_bike).to be_a(Bike)
    end

    it "Returns true from Working? method" do
     expect(@docking_station.release_bike.working?).to eq(true)
    end

    it "Releasing bike from empty station returns warning" do
      @docking_station.release_bike
      expect{@docking_station.release_bike}.to raise_error("No bike available")
    end

    #it "Releases max of 20 bikes" do
    #end
#--------- Release_bike ------------------------------------------------

# Test for the Dock method
    it {is_expected.to respond_to(:dock).with(1).argument}

    #it "Calling dock bike when the station is not free returns warning" do
      #@docking_station.dock(@bike)
    #  expect{@docking_station.dock(@bike)}.to raise_error("Unable to dock bike")
    #end

    it "Calling dock bike when the station is free returns success message" do
      bike1 = @docking_station.release_bike
      #puts bike1
      expect(@docking_station.dock(bike1)).to eq "Bike docked"
    end

    it "Dock more than a bike up to a max of 20 bikes" do
      expect{20.times{@docking_station.dock(@bike)}}.to raise_error("Unable to dock more bikes")
    end
#--------- end of Dock ---------------------------------------------------------


describe DockingStation do
  let (:bike) {double :bike}

  before(:each) do
    @docking_station = DockingStation.new
    @bike = Bike.new
  end

  it "should create an object for DockingStation" do
    expect(DockingStation.new(40)).to be_a(DockingStation)
  end

  it "should create an object for DockingStation with capacity of 80" do
    expect(DockingStation.new(80).size_of_station).to eq(80)
  end

  it { is_expected.to respond_to(:release_bike) }
#  it { is_expected.to respond_to(:empty?) }
#  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:dock_defective_bike) }
  it {is_expected.to respond_to(:dock).with(1).argument}

  it "Release bike creates an instance of Bike Class" do
    expect(@docking_station.release_bike).to be_a(Bike)
  end

  it "Returns true from working? method" do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq(true)
    #expect(@docking_station.release_bike.working?).to eq(true)
  end

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

  it "Releasing bike from station with only faulty bikes returns warning" do
    allow(bike).to receive(:working?).and_return(false)
    allow(bike).to receive(:condition_to_defective)
    @docking_station.release_bike
    @docking_station.dock_defective_bike(bike)
    expect{@docking_station.release_bike}.to raise_error("No bike available")
  end

  it "Calling dock bike when the station is free returns success message" do
    bike1 = @docking_station.release_bike
    expect(@docking_station.dock(bike1)).to eq "Bike docked"
  end

  it "Shows condition as defective when returning defective bike" do
    allow(bike).to receive(:working?).and_return(false)
    allow(bike).to receive(:condition_to_defective)
    @docking_station.dock_defective_bike(bike)
    expect(bike.working?).to eq(false)
  end

end
