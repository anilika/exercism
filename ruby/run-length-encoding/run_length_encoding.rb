module RunLengthEncoding
  def self.encode(data)
    number, result = 0, ''
    data.chars.each_with_index do |char, index|
      number += 1
      unless char == data[index+1]
        number = '' if number == 1
        result << number.to_s + char
        number = 0
      end
    end
    result
  end

  def self.decode(data)
    nums, letters = data.split(/[^0-9]/), data.scan(/[^0-9]/)
    letters.zip(nums).map do |pair|
      pair.last == '' || pair.last.nil?  ? pair.first : pair.first * pair.last.to_i
    end.join
  end
end
