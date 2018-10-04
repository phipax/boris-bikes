require "boris_bikes"

describe Van do

  before :each do
    @van = Van.new
  end

  it "fetches broken bikes from docking station" do
    dockingstation = DockingStation.new
    dockingstation.dock_defective_bike(Bike.new)
    expect(@van.fetch_broken_bikes(dockingstation)).to eq (1)
  end

end
