require "boris_bikes"

describe Bike do

  it {is_expected.to respond_to(:working?)}
  it { is_expected.to respond_to(:condition_to_defective) }

end
