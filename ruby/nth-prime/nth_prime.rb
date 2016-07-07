class Prime
  @@primes = [2, 3]

  def self.nth(number)
    raise ArgumentError if number.zero?
    prime, index = primes.last, number - 1
    until primes[index]
      primes << prime unless primes.any? { |num| prime % num == 0 }
      prime += 2
    end
    primes[index]
  end

  def self.primes
    @@primes
  end
  
  private_class_method :primes
end
