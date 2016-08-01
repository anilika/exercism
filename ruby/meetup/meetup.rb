require 'date'

class Array
  def second; self[1]; end

  def third; self[2]; end

  def fourth; self[3]; end
end

class Meetup
  def initialize(month, year)
    first_day = Date.new(year, month)
    @month = first_day.upto(first_day.next_month - 1)
  end

  def day(weekday, schedule)
    days = @month.select { |day| day.send(weekday.to_s + '?') }
    days.respond_to?(schedule) ? days.send(schedule) : teenth(days)
  end

  private

  def teenth(days)
    days.select { |day| (13..19).cover?(day.day) }[0]
  end
end
