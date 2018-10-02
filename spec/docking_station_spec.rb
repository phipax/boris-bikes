  require "boris_bikes"

  describe DockingStation do
    before(:each) do
     @docking_station = DockingStation.new
     @bike = Bike.new
   end

    it "should create an object for DockingStation" do
      expect(DockingStation.new).to be_a(DockingStation)
    end

     it { is_expected.to respond_to(:release_bike) }

     it "Release bike creating an instance of Bike Class" do
       expect(@docking_station.release_bike).to be_a(Bike)
     end

     it "Returns true from Working? method" do
       expect(@docking_station.release_bike.working?).to eq(true)
     end

     it {is_expected.to respond_to(:dock).with(1).argument}

     it "Calling dock bike when the station is not free returns warning" do
       expect(@docking_station.dock(@bike)).to eq "Unable to dock bike"
     end

     it "Releasing bike from empty station returns warning" do
       @docking_station.release_bike
       expect(@docking_station.release_bike).to eq "No bike available"
     end

  end
