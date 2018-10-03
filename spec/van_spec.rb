require "boris_bikes"

describe Van do

  it "fetches broken bikes from docking station" do
    dockingstation = DockingStation.new
    dockingstation.dock_defective_bike(Bike.new)
    expects (subject.fetch_broken_bikes(dockingstation)).to eq (1)
  end

end
