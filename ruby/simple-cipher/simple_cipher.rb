class Cipher
  attr_reader :key

  def initialize(key = generated_key)
    raise ArgumentError if key.empty? || key.scan(/[A-Z0-9]/).size.nonzero?
    @key = key
    @abc = ('a'..'z').to_a
  end

  def encode(plaintext)
    plaintext.chars.zip(key.chars).each_with_object('') do |pair, encode_text|
      letter, key = pair
      index_encode_letter = @abc.index(letter) + @abc.index(key)
      encode_letter  = @abc[index_encode_letter] ? @abc[index_encode_letter] : @abc[index_encode_letter - 26]
      encode_text << encode_letter
    end
  end

  def decode(ciphertext)
    ciphertext.chars.zip(@key.chars).each_with_object('') do |pair, decode_text|
      cipherletter, key = pair
      index_decode_letter = @abc.index(cipherletter) - @abc.index(key)
      decode_text << @abc[index_decode_letter]
    end
  end

  private

  def generated_key
    (('a'..'z').to_a.reverse * 4).reverse.join
  end
end
