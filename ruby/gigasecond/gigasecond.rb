require 'date'
require 'time'

class Gigasecond
  GIGA = 10**9
  def self.from(utc_data)
    Time.at(utc_data.to_i + GIGA).utc
  end
end
