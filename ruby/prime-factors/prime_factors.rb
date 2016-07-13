class PrimeFactors
  @@primes = [2, 3]

  def self.for(num)
    dividend, result, num_prime = num, [], 0
    return result if dividend == 1
    loop do
      divider = primes[num_prime]
      divider = next_prime unless divider
      quotient, end_num = dividend.divmod(divider)
      if end_num.zero?
        result.push(divider)
        break if quotient == 1
        dividend = quotient
      else
        num_prime += 1
      end
    end
    result
  end

  def self.next_prime
    number = primes.size
    prime, index = primes.last, number
    until primes[index]
      @@primes << prime unless primes.any? { |num| prime % num == 0 }
      prime += 2
    end
    primes[index]
  end

  def self.primes
    @@primes
  end

  private_class_method :next_prime, :primes
end
