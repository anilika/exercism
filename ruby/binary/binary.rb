class Binary
  def initialize(bin_num)
    raise ArgumentError unless check_num(bin_num)
    @bin_num = bin_num.chars.reverse
  end

  def to_decimal
    bin_num.each_with_index.inject(0) { |sum , (num, index)| sum + num.to_i * (2**index) }
  end

  private

  def check_num(num)
    num.split(/[0-1]/).empty?
  end
  attr_reader :bin_num
end
