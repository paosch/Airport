class Weather
  def weather_generator
    value = rand(4)
    if value >= 1
      :sunny
    else
      :stormy
    end
  end
end
# value >= 1 ? :sunny : :stormy
