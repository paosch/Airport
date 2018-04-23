require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { double('plane1') }
  let(:plane2) { double('plane2') }

  describe '#land' do
    it 'instruct plane to land' do
      # allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.land(plane1, :sunny)).to eq([plane1])
    end

    it 'prevents landing when stormy' do
      # allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane1, :stormy) }.to raise_error 'Bad weather, landing denied'
    end

    it 'prevents landing when plane already in airport' do
      airport.hangar = [plane2]
      # allow(airport.weather).to receive(:stormy?).and_return(false)
      expect { airport.land(plane2, :sunny) }.to raise_error 'Plane in airport, it cannot land again'
    end

    it 'prevents landing when airport full' do
      # allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.capacity = 1 # was landing same plane 20.times, so it made the previous test fail
      airport.hangar = [plane1] # can change capacity because I have an attr_accessor
      expect { airport.land(plane2, :sunny) }.to raise_error 'Airport full, landing denied'
    end
  end

  describe '#take_off' do
    it 'plane in hangar takes off, hangar becomes empty' do
      airport.hangar = [plane1] # better than forcing sunny weather and landing plane, independent from land method
      # allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane1, :sunny)).to eq([])
    end
    it 'one of the two planes in hangar takes off, one plane left in hangar' do
      airport.hangar = [plane1, plane2]
      # allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane1, :sunny)).to eq([plane2])
    end
    it 'prevents take off when stormy' do
      airport.hangar = [plane1]
      # allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane1, :stormy) }.to raise_error 'Bad weather, takeoff denied'
    end
  end
    it 'prevents take off when plane already flying' do
      # allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.hangar = []
      expect { airport.take_off(plane1, :sunny) }.to raise_error 'Plane already flying, it cannot take off'
    end
  end
