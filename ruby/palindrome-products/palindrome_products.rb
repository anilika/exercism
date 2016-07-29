class Palindromes
  attr_reader :palindromes
  def initialize(factors)
    @max_factor = factors[:max_factor]
    @min_factor = factors[:min_factor] || 1
    @palindromes = []
  end

  def generate
    result = Hash.new { |hsh, key| hsh[key] = [] }
    (@min_factor..@max_factor).each do |first_factor|
      (@min_factor..first_factor).each do |second_factor|
        product, factors = first_factor * second_factor, [first_factor, second_factor]
        result[product].push(factors) if palindrome?(product)
      end
    end
    @palindromes = result.map { |key, value| Palindrome.new(key, value) }
  end

  def largest
    @palindromes.sort.last
  end

  def smallest
    @palindromes.sort.first
  end

  private

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors.map { |factor| factor.map(&:abs).sort }
  end

  def <=>(other)
    value <=> other.value
  end
end
