require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { Plane.new('747') }
  let(:plane2) { Plane.new('999') }

  describe '#land' do
    it "instruct plane to land" do
      expect(airport.land(plane1)).to eq([plane1])
    end
  end

  describe '#take_off' do
    it 'plane in hangar takes off, hangar becomes empty' do
      airport.land(plane1)
      expect(airport.take_off(plane1)).to eq([])
    end
    it 'one of the two planes in hangar takes off, one plane left in hangar' do
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.take_off(plane1)).to eq([plane2])
    end
  end
end
