class Prime
  @@primes = []

  def self.nth(n)
    raise ArgumentError if n < 1

    k = @@primes.last || 1

    while @@primes.size < n
      k += 1
      @@primes << k if prime?(k)
    end

    @@primes[n - 1]
  end

  def self.prime?(num)
    return if num < 2

    Math.sqrt(num).to_i.downto(2).each { |i| return if num % i == 0 }
  end
end
