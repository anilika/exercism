class SecretHandshake
  HANDSHAKE_CODE = ['wink', 'double blink', 'close your eyes', 'jump'].freeze
  def initialize(decimal_num)
    @decimal_num = decimal_num
  end

  def commands
    return [] unless @decimal_num.is_a?(Integer)
    binary_array = @decimal_num.to_s(2).reverse.chars
    sequence = binary_array.zip(HANDSHAKE_CODE)
                           .select { |pair| pair.include?('1') && pair.last }
                           .map(&:last)
    binary_array.size >= 5 ? sequence.reverse : sequence
  end
end
