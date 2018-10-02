  require "boris_bikes"

  describe DockingStation do
    before(:each) do
     @docking_station = DockingStation.new
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

  end
