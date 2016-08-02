class Sieve
  PRIMES_FILE = '/tmp/primes.data'.freeze
  FIRST_PRIMES = [2, 3].freeze
  STEP = 2

  def initialize(num)
    @num = num
    @primes = load_primes
  end

  def primes
    return @primes.select { |prime| prime <= @num } if @primes.last >= @num
    ((@primes.last + STEP)..@num).reject do |prime|
      @primes << prime unless @primes.any? { |num| prime % num == 0 }
    end
    dump_primes
    @primes
  end

  private

  def load_primes
    begin
      Marshal.load(File.read(PRIMES_FILE))
    rescue Errno::ENOENT, ArgumentError
      FIRST_PRIMES
    end
  end

  def dump_primes
    File.write(PRIMES_FILE, Marshal.dump(@primes))
  end
end
