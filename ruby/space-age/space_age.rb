class SpaceAge
  YEAR_ON_PLANETS = { on_mercury: 0.2408467, on_venus: 0.61519726,
                      on_mars: 1.8808158, on_jupiter: 11.862615,
                      on_saturn: 29.447498, on_uranus: 84.016846,
                      on_neptune: 164.79132 }.freeze
  EARTH_YEAR = 31557600.0

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(method)
    seconds / (EARTH_YEAR * YEAR_ON_PLANETS[method])
  end

  def on_earth
    seconds / EARTH_YEAR
  end
end
