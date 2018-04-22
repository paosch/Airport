require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new}
  describe '#land' do
    it "instruct plane to land" do
      expect(airport.land(plane)).to eq(plane)
    end
  end

  describe '#take_off' do
    it "allows plane to take off and confirms it's left the airport" do
      airport.land(plane)
      expect(airport.take_off(plane)).not_to eq(plane) # confirms plane not there
    end
  end
end
