class Weather
  def weather_generator
    [:sunny, :sunny, :sunny, :stormy].sample
  end

  def stormy?
    weather_generator == :stormy
  #   if weather_generator == :stormy
  #     return true
  #   else
  #     return false
  #   end
  end
end
