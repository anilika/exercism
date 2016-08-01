class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if num > @digits.size
    0.upto(@digits.size - num).map { |index| @digits.slice(index, num) }
  end
end
