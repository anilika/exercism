module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    sum = 1.upto(number - 1).select { |num| (number % num).zero? }.inject(:+)
    return 'perfect' if sum == number
    number > sum ? 'deficient' : 'abundant'
  end
end
