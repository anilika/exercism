class Sieve
  def initialize(num)
    @num = num
  end

  def primes
    result = []
    numbers = (2..@num).to_a
    until numbers.empty?
      result << numbers.shift
      numbers.reject! { |num| (num % result.last).zero? }
    end
    result
  end
end
