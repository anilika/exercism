class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    @plaintext.gsub(/\W+/, '').downcase
  end

  def size
    @size ? @size : @size = calc_size
  end

  def plaintext_segments
    separate(normalize_plaintext, size).map { |segment| segment.join }
  end

  def ciphertext
    segments = separate(normalize_plaintext, size)
    segments[0].zip(*segments[1..-1]).join
  end

  def normalize_ciphertext
    rows_num = size == 2 ? size : size - 1
    result = separate(ciphertext, rows_num).map { |segment| segment.join }
    if normalize_plaintext.length == size * rows_num
      result.join(' ')
    else
      num_spaces = result.first.size - result.last.size
      ends_segments = separate(result[-num_spaces..-1].join, rows_num - 1)
      (result[0...-num_spaces] + ends_segments.map {|segment| segment.join }).join(' ')
    end
  end

  private

  def separate(text, num)
    return [text] if num == 0
    text.chars.each_slice(num).to_a
  end

  def calc_size
    root = Math.sqrt(normalize_plaintext.length)
    root.to_i == root ? root.to_i : root.to_i + 1
  end
end
