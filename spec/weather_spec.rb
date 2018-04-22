require 'weather'

describe Weather do
  subject(:weather) { Weather.new }
  describe '#stormy?' do
    it 'it checks weather condition' do
      allow(weather).to receive(:weather_generator).and_return(:stormy)
      expect(weather.stormy?).to eq(true)
    end
  end
end
