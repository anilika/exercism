class Hexadecimal
  LITERALS = {'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 }

  def initialize(hex_num)
    @hex_num = hex_num
  end

  def to_decimal
    return 0 unless @hex_num.scan(/\H/).empty?
    @hex_num.chars.reverse.each_with_index.inject(0) do |sum , (num, index)|
      num = LITERALS[num] ? LITERALS[num] : num.to_i
      sum + num * (16**index)
    end
  end
end