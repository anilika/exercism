class Series
  def initialize(string_digits)
    @digits = string_digits
  end

  def largest_product(series)
    return 1 if series.zero?
    raise ArgumentError if series > @digits.size || @digits.scan(/[a-z]/).any?
    @digits.chars.map(&:to_i).each_cons(series).map { |nums| nums.inject(:*) }.max
  end
end
