require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { double("plane1") }
  let(:plane2) { double("plane2") }

  describe '#land' do
    it "instruct plane to land" do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.land(plane1)).to eq([plane1])
    end

    it "prevents landing when stormy" do
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane1) }.to raise_error 'Landing denied'
    end
  end

  describe '#take_off' do
    it 'plane in hangar takes off, hangar becomes empty' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane1)
      expect(airport.take_off(plane1)).to eq([])
    end
    it 'one of the two planes in hangar takes off, one plane left in hangar' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane1)
      airport.land(plane2)
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane1)).to eq([plane2])
    end
    it 'prevents take off when stormy' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane1)
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane1) }.to raise_error 'Takeoff denied'
    end
  end
end
