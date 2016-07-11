class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if num > digits.size
    digits[0..-num].each_index.map { |index| digits.slice(index, num) }
  end

  private
  attr_reader :digits
end