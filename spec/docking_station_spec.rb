  require "boris_bikes"

  describe DockingStation do
    before(:each) do
     @docking_station = DockingStation.new
     @bike = Bike.new
   end

    it "should create an object for DockingStation" do
      expect(DockingStation.new).to be_a(DockingStation)
    end

  #  describe "#release_bike" do
  #    it "raises error when no bikes are available" do
  #      bike = Bike.new
  #      subject.dock(bike)
  #      expect {subject.release_bike}.to raise_error 'No bikes available'
  #  end
  #  end

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
       expect{@docking_station.release_bike}.to raise_error("No bike available")
     end

     it "Calling dock bike when the station is free returns success message" do
       bike1 = @docking_station.release_bike
       expect(@docking_station.dock(bike1)).to eq "Bike docked"
     end
end
