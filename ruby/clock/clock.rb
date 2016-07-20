class Clock
  include Comparable
  PERIODS = { hour: 24, minute: 60, day: 1440 }.freeze
  attr_reader :minutes_time

  def self.at(hours, minutes)
    minutes = (minutes + hours * PERIODS[:minute]) % PERIODS[:day]
    new(minutes)
  end

  def initialize(minutes)
    @minutes_time = minutes
  end

  def <=>(other)
    minutes_time <=> other.minutes_time
  end

  def +(other)
    Clock.new(minutes_time + other)
  end

  def to_s
    time = time_to_h_m.map { |num| add_zero(num) }
    "#{time.first}:#{time.last}"
  end

  private

  def time_to_h_m
    hours, minutes = minutes_time.divmod(PERIODS[:minute])
    hours = hours % PERIODS[:hour]
    [hours.to_s, minutes.to_s]
  end

  def add_zero(time)
    time.size == 1 ? time.insert(0, '0') : time
  end
end
