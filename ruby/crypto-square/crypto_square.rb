class Crypto
  def initialize(phrase)
    @phrase = normalize(phrase)
    @columns_num = calc_size(@phrase)
    @rows_num = (@phrase.size % @columns_num).zero? ? @phrase.size / @columns_num : @columns_num - 1
  end

  def normalize(phrase)
    phrase.gsub(/\W+/, '').downcase
  end

  def plaintext_segments
    @phrase.chars.each_slice(@columns_num).map {|chars| chars.join }
  end

  def ciphertext
    crypt_segments = plaintext_segments.map { |chars| chars.chars }
    crypt_segments[0].zip(*crypt_segments[1..-1]).flatten.join
  end

  def normalize_ciphertext
    case @phrase.size - (@columns_num * @rows_num)
      when 0
       ciphertext.chars.each_slice(@rows_num).map { |chars| chars.join }.join(' ')
      else
        @rows_num += 1 if @rows_num == 1
        phrase = ciphertext.chars.each_slice(@rows_num).map { |chars| chars.join }
        num_little_pis = phrase[0].size - phrase[-1].size
        end_phrase = phrase[0...-num_little_pis] + phrase[-num_little_pis..-1].join.chars.each_slice(@rows_num - 1).map{|x| x.join}
        end_phrase.join(' ')
     end
  end

  def normalize_plaintext
    @phrase
  end

  def calc_size(length_phrase)
    root = Math.sqrt(@phrase.size)
    root.to_i == root ? root.to_i : root.to_i + 1
  end

  def size
    @columns_num
  end
end
