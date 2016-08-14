class Triplet
  def self.where(factors)
    max_factor = factors[:max_factor]
    min_factor = factors[:min_factor] || 1
    sum = factors[:sum] || 1
    generate_triplet(min_factor, max_factor).map do |triplet|
      new(triplet) if (triplet.inject(:+) % sum).zero?
    end.compact
  end

  def self.generate_triplet(min_factor, max_factor)
    a = b = min_factor
    result = []
    until a == max_factor || b == max_factor do
      square_c = a * a + b * b
      c = Math.sqrt(square_c).floor
      result << [a, b, c] if c * c == square_c
      if b < a
        b += 1
      else
        a += 1
        b = min_factor
      end
    end
    result
  end

  def initialize(*numbers)
    @numbers = numbers.flatten
  end

  def sum
    @numbers.inject(:+)
  end

  def product
    @numbers.inject(:*)
  end

  def pythagorean?
    @numbers.first(2).inject(0) { |sum, num| sum + num**2 } == @numbers.last**2
  end

  private_class_method :generate_triplet
end
