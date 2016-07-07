class Fixnum
  NUMERALS = { 1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L',
              100 => 'C', 500 => 'D', 1000 => 'M' }.freeze
  DIVISORS = [1000, 100, 10, 1].freeze

  def to_roman
    result, number = '', self
    DIVISORS.each do |divisor|
      quotient, number = number.divmod(divisor)
      case quotient
      when (1..3)
        result << NUMERALS[divisor] * quotient
      when 4, 9
        result << NUMERALS[divisor] + NUMERALS[(divisor * (quotient + 1))]
      when (5..8)
        result << NUMERALS[(divisor * 5)] + NUMERALS[divisor] * (quotient - 5)
      end
    end
    result
  end
end

