class Cipher
  attr_reader :key

  def initialize(key = generated_key)
    raise ArgumentError if key.empty? || key.scan(/[A-Z0-9]/).size.nonzero?
    @key = key
    @abc = ('a'..'z').to_a
  end

  def encode(plaintext)
    each_with_key(plaintext) do |letter, key|
      index_letter = @abc.index(letter) + @abc.index(key)
      @abc[index_letter] ? @abc[index_letter] : @abc[index_letter - @abc.size]
    end
  end

  def decode(ciphertext)
    each_with_key(ciphertext) do |cipherletter, key|
      @abc[@abc.index(cipherletter) - @abc.index(key)]
    end
  end

  private

  def each_with_key(text)
    text.chars.zip(key.chars).map do |pair|
      yield(pair.first, pair.last)
    end.join
  end

  def generated_key
    0.upto(100).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
