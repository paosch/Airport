require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new}
  describe '#land' do
    it "instruct plane to land" do
      expect(airport.land(plane)).to eq(plane)
    end
  end
end
