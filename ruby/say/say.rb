class Say
  ONES = { 1 => 'one', 2 => 'two', 3 => 'three',
           4 => 'four', 5 => 'five', 6 => 'six',
           7 => 'seven', 8 => 'eight', 9 => 'nine' }.freeze
  TWENTIES = { 10 => 'ten', 11 => 'eleven', 12 => 'twelve',
               13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen',
               16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
               19 => 'nineteen' }.freeze
  TENS = { 2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty',
           6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety' }.freeze
  PREFIXES = [nil, 'thousand', 'million', 'billion'].freeze

  def initialize(number)
    @number = number
  end

  def divide_1000(num)
    return [num] if num < 1000
    result = []
    loop do
      num, rest = num.divmod(1000)
      result << rest
      return result.reverse if num == 0
    end
  end

  def add_prefixes(divided_num)
    divided_num.reverse.each_with_index.map do |num, index|
      [num, PREFIXES[index]]
    end.reverse
  end

  def in_english
    raise ArgumentError unless (0...10**12).cover?(@number)
    return 'zero' if @number.zero?
    add_prefixes(divide_1000(@number)).map do |num|
      next if num.first.zero?
      hundreds, tens = num.first.divmod(100)
      [tr_hundreds(hundreds), tr_tens_and_ones(tens), num.last]
    end.flatten.compact.join(' ')
  end

  def tr_hundreds(num)
    num.zero? ? nil : "#{ONES[num]} hundred"
  end

  def tr_tens_and_ones(num)
    case num
    when 0 then nil
    when (1..9) then ONES[num]
    when (10..19) then TWENTIES[num]
    else
      tens, ones = num.divmod(10)
      "#{TENS[tens]}#{'-' unless ones.zero?}#{ONES[ones]}"
    end
  end
end
