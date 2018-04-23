require 'weather'

describe Weather do
  subject(:weather) { Weather.new }
  describe '#weather_generator' do
    it 'it generates random weather' do
      srand(3)
      expect(weather.weather_generator).to eq(:sunny)
    end
  end
end
