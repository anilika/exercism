class Luhn
  def self.create(number)
    number *= 10
    new_number = new(number)
    return number if new_number.valid?
    number + (10 - new_number.checksum % 10)
  end

  def initialize(number)
    @number = number.to_s.chars.map(&:to_i)
  end

  def addends
    property = @number.size.even? ? 'even?' : 'odd?'
    @number.each_with_index.map do |numeral, index|
      index.send(property) ? numeral *= 2 : numeral
      numeral > 9 ? numeral - 9 : numeral
    end
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end
end
