class Trinary
  def initialize(trinary_num)
    @trinary_num = trinary_num.chars.reverse
  end

  def to_decimal
    return 0 unless num_valid?
    trinary_num.each_with_index.inject(0) { |sum, (num, index)| sum + num.to_i * (3**index) }
  end

  private

  def num_valid?
    trinary_num.join.scan(/[^0-2]/).empty?
  end

  attr_reader :trinary_num
end
